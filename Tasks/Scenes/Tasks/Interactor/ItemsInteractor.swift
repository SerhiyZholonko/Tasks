//
//  ItemsInteractor.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import Foundation

// MARK: - Interactors
class ItemsInteractor: ItemsInteractorLogic {
    private let presenter: ItemsPresenterLogic
    private let itemsService: ItemsServiceProtocol
    
    init(presenter: ItemsPresenterLogic, itemsService: ItemsServiceProtocol) {
        self.presenter = presenter
        self.itemsService = itemsService
    }
    
    func fetchItems() {
        itemsService.fetchItems { [weak self] result in
            switch result {
            case .success(let items):
                self?.presenter.presentItems(items)
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }
    
    func addItem(title: String, description: String, priority: Item.Priority) {
        let newItem = Item(title: title, description: description, priority: priority)
        itemsService.addItem(newItem) { [weak self] result in
            switch result {
            case .success:
                self?.fetchItems() // Reload the list
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }
    
    func deleteItem(id: UUID) {
        itemsService.deleteItem(id: id) { [weak self] result in
            switch result {
            case .success:
                self?.fetchItems() // Reload the list
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }
    
    func markItemComplete(id: UUID) {
        itemsService.markItemComplete(id: id) { [weak self] result in
            switch result {
            case .success:
                self?.fetchItems() // Reload the list
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }
}
