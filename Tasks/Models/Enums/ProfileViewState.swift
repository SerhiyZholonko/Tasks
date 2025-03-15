//
//  ProfileViewState.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

// MARK: - View States

import Foundation

enum ProfileViewState {
    case loading
    case loaded(UserProfile)
    case error(String)
}
