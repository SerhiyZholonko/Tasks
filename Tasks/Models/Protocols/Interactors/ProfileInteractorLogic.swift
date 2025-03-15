//
//  ProfileInteractorLogic.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import Foundation

protocol ProfileInteractorLogic {
    func fetchProfile()
    func updateProfile(profile: UserProfile)
    func updatePreference(notificationsEnabled: Bool?, darkModeEnabled: Bool?, defaultPriority: Item.Priority?)
}
