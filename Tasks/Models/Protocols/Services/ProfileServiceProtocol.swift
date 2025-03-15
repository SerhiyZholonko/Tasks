//
//  ProfileServiceProtocol.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import Foundation

protocol ProfileServiceProtocol {
    func fetchProfile(completion: @escaping (Result<UserProfile, Error>) -> Void)
    func updateProfile(_ profile: UserProfile, completion: @escaping (Result<Void, Error>) -> Void)
    func updatePreferences(notificationsEnabled: Bool?, darkModeEnabled: Bool?, defaultPriority: Item.Priority?, completion: @escaping (Result<Void, Error>) -> Void)
}
