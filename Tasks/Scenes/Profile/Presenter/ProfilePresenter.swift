//
//  ProfilePresenter.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import Foundation



class ProfilePresenter: ProfilePresenterLogic, ObservableObject {
    @Published var state: ProfileViewState = .loading
    
    func presentProfile(_ profile: UserProfile) {
        DispatchQueue.main.async { [weak self] in
            self?.state = .loaded(profile)
        }
    }
    
    func presentError(_ error: Error) {
        DispatchQueue.main.async { [weak self] in
            self?.state = .error(error.localizedDescription)
        }
    }
}
