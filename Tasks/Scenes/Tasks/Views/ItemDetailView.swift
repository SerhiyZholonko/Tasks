//
//  ItemDetailView.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import SwiftUI

struct ItemDetailView: View {
    let item: Item
    let interactor: ItemsInteractorLogic
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isCompleted = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                HStack {
                    Text(item.title)
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    // Priority indicator
                    VStack {
                        Circle()
                            .fill(item.priority.color)
                            .frame(width: 16, height: 16)
                        Text(item.priority.rawValue.capitalized)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                // Description
                VStack(alignment: .leading, spacing: 8) {
                    Text("Description")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text(item.description)
                        .font(.body)
                }
                
                // Created date
                VStack(alignment: .leading, spacing: 8) {
                    Text("Created")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text(formattedDate(item.createdAt))
                        .font(.body)
                }
                
                // Task completion toggle
                Toggle(isOn: $isCompleted) {
                    Text("Mark as Completed")
                        .font(.headline)
                }
                .onChange(of: isCompleted) { _, newValue in
                    interactor.markItemComplete(id: item.id)
                }
                
                Spacer()
                
                // Delete button
                Button(action: {
                    interactor.deleteItem(id: item.id)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "trash")
                        Text("Delete Task")
                    }
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
