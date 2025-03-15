//
//  ItemsPresenterLogic.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import Foundation

protocol ItemsPresenterLogic {
    func presentItems(_ items: [Item])
    func presentError(_ error: Error)
}
