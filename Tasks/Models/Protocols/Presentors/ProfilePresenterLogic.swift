//
//  ProfilePresenterLogic.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import Foundation

protocol ProfilePresenterLogic {
    func presentProfile(_ profile: UserProfile)
    func presentError(_ error: Error)
}
