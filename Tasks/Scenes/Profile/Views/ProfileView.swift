//
//  ProfileView.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import SwiftUI


// MARK: - Profile View
struct ProfileView: View {
    private let interactor: ProfileInteractorLogic
    @ObservedObject private var presenter: ProfilePresenter
    @State private var showingEditProfileSheet = false
    
    init(interactor: ProfileInteractorLogic, presenter: ProfilePresenter) {
        self.interactor = interactor
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            contentView
                .navigationTitle("Profile")
                .toolbar {
                    Button(action: {
                        showingEditProfileSheet = true
                    }) {
                        Image(systemName: "pencil")
                    }
                }
        }
        .onAppear {
            interactor.fetchProfile()
        }
    }
    
    private var contentView: some View {
        Group {
            switch presenter.state {
            case .loading:
                loadingView
            case .loaded(let profile):
                profileContentView(profile: profile)
            case .error(let message):
                errorView(message: message)
            }
        }
    }
    
    private var loadingView: some View {
        ProgressView("Loading profile...")
    }
    
    private func errorView(message: String) -> some View {
        VStack {
            Text("Error: \(message)")
                .foregroundColor(.red)
            Button("Try Again") {
                interactor.fetchProfile()
            }
            .buttonStyle(.bordered)
            .padding()
        }
    }
    
    private func profileContentView(profile: UserProfile) -> some View {
        ScrollView {
            VStack(spacing: 24) {
                profileHeaderView(profile: profile)
                statsView(profile: profile)
                bioView(profile: profile)
                preferencesView(profile: profile)
            }
            .padding()
        }
    }
    
    private func profileHeaderView(profile: UserProfile) -> some View {
        VStack(spacing: 12) {
            Image(systemName: profile.profileImage)
                .font(.system(size: 80))
                .foregroundColor(.blue)
                .padding()
            
            Text(profile.name)
                .font(.title)
                .bold()
            
            Text(profile.email)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("Member since \(formattedDate(profile.joinDate))")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    private func statsView(profile: UserProfile) -> some View {
        VStack(alignment: .leading) {
            Text("Statistics")
                .font(.headline)
                .padding(.bottom, 8)
            
            HStack {
                StatView(title: "Tasks Completed", value: "\(profile.totalTasksCompleted)")
                
                Divider()
                    .frame(height: 40)
                
                StatView(title: "Default Priority", value: profile.preferences.defaultTaskPriority.rawValue.capitalized)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    private func bioView(profile: UserProfile) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("About")
                .font(.headline)
            
            Text(profile.bio)
                .font(.body)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    private func preferencesView(profile: UserProfile) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Preferences")
                .font(.headline)
                .padding(.bottom, 4)
            
            preferencesToggleView(profile: profile)
            priorityPickerView(profile: profile)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    private func preferencesToggleView(profile: UserProfile) -> some View {
        VStack {
            Toggle("Notifications", isOn: Binding(
                get: { profile.preferences.notificationsEnabled },
                set: { newValue in
                    interactor.updatePreference(notificationsEnabled: newValue, darkModeEnabled: nil, defaultPriority: nil)
                }
            ))
            
            Toggle("Dark Mode", isOn: Binding(
                get: { profile.preferences.darkModeEnabled },
                set: { newValue in
                    interactor.updatePreference(notificationsEnabled: nil, darkModeEnabled: newValue, defaultPriority: nil)
                }
            ))
        }
    }
    
    private func priorityPickerView(profile: UserProfile) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Default Task Priority")
                .fontWeight(.medium)
            
            Picker("Default Priority", selection: Binding(
                get: { profile.preferences.defaultTaskPriority },
                set: { newValue in
                    interactor.updatePreference(notificationsEnabled: nil, darkModeEnabled: nil, defaultPriority: newValue)
                }
            )) {
                ForEach(Item.Priority.allCases, id: \.self) { priority in
                    priorityRow(priority: priority)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
    private func priorityRow(priority: Item.Priority) -> some View {
        HStack {
            Circle()
                .fill(priority.color)
                .frame(width: 12, height: 12)
            Text(priority.rawValue.capitalized)
        }
        .tag(priority)
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}
