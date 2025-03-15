//
//  MainTabView.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

// MARK: - Main TabView

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TasksSceneFactory.makeItemsScene()
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }
                .tag(0)
            
            ProfileSceneFactory.makeProfileScene()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tag(1)
        }
    }
}
