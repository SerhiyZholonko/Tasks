//
//  ItemsPresenter.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import Foundation

// MARK: - Presenters
class ItemsPresenter: ItemsPresenterLogic, ObservableObject {
    @Published var state: ItemsViewState = .loading
    
    func presentItems(_ items: [Item]) {
        DispatchQueue.main.async { [weak self] in
            self?.state = .loaded(items)
        }
    }
    
    func presentError(_ error: Error) {
        DispatchQueue.main.async { [weak self] in
            self?.state = .error(error.localizedDescription)
        }
    }
}
