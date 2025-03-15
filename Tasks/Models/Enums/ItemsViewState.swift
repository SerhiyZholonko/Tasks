//
//  ItemsViewState.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

// MARK: - View States

import Foundation

enum ItemsViewState {
    case loading
    case loaded([Item])
    case error(String)
}
