//
//  UserProfile.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import Foundation

struct UserProfile {
    var name: String
    var email: String
    var joinDate: Date
    var bio: String
    var profileImage: String // In a real app, this would be an actual image
    var totalTasksCompleted: Int
    var preferences: Preferences
    
    struct Preferences {
        var notificationsEnabled: Bool
        var darkModeEnabled: Bool
        var defaultTaskPriority: Item.Priority
    }
    
    static let mock = UserProfile(
        name: "John Doe",
        email: "john.doe@example.com",
        joinDate: Date().addingTimeInterval(-86400 * 120), // 120 days ago
        bio: "Task management enthusiast. I love organizing my life with this app.",
        profileImage: "person.circle.fill",
        totalTasksCompleted: 42,
        preferences: Preferences(
            notificationsEnabled: true,
            darkModeEnabled: false,
            defaultTaskPriority: .medium
        )
    )
}
