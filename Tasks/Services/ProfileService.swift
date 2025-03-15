//
//  ProfileService.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import Foundation


class ProfileService: ProfileServiceProtocol {
    private var profile = UserProfile.mock
    
    func fetchProfile(completion: @escaping (Result<UserProfile, Error>) -> Void) {
        // Simulate network delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            completion(.success(self.profile))
        }
    }
    
    func updateProfile(_ profile: UserProfile, completion: @escaping (Result<Void, Error>) -> Void) {
        // Simulate network delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            self.profile = profile
            completion(.success(()))
        }
    }
    
    func updatePreferences(notificationsEnabled: Bool?, darkModeEnabled: Bool?, defaultPriority: Item.Priority?, completion: @escaping (Result<Void, Error>) -> Void) {
        // Simulate network delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            var preferences = self.profile.preferences
            
            if let notificationsEnabled = notificationsEnabled {
                preferences.notificationsEnabled = notificationsEnabled
            }
            
            if let darkModeEnabled = darkModeEnabled {
                preferences.darkModeEnabled = darkModeEnabled
            }
            
            if let defaultPriority = defaultPriority {
                preferences.defaultTaskPriority = defaultPriority
            }
            
            self.profile.preferences = preferences
            completion(.success(()))
        }
    }
}
