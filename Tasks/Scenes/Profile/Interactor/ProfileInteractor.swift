//
//  ProfileInteractor.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import Foundation

class ProfileInteractor: ProfileInteractorLogic {
    private let presenter: ProfilePresenterLogic
    private let profileService: ProfileServiceProtocol
    
    init(presenter: ProfilePresenterLogic, profileService: ProfileServiceProtocol) {
        self.presenter = presenter
        self.profileService = profileService
    }
    
    func fetchProfile() {
        profileService.fetchProfile { [weak self] result in
            switch result {
            case .success(let profile):
                self?.presenter.presentProfile(profile)
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }
    
    func updateProfile(profile: UserProfile) {
        profileService.updateProfile(profile) { [weak self] result in
            switch result {
            case .success:
                self?.fetchProfile()
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }
    
    func updatePreference(notificationsEnabled: Bool? = nil, darkModeEnabled: Bool? = nil, defaultPriority: Item.Priority? = nil) {
        profileService.updatePreferences(notificationsEnabled: notificationsEnabled, darkModeEnabled: darkModeEnabled, defaultPriority: defaultPriority) { [weak self] result in
            switch result {
            case .success:
                self?.fetchProfile()
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }
}
