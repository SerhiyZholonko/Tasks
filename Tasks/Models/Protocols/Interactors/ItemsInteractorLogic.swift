//
//  ItemsInteractorLogic.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import Foundation


// MARK: - Use Cases / Business Logic
protocol ItemsInteractorLogic {
    func fetchItems()
    func addItem(title: String, description: String, priority: Item.Priority)
    func deleteItem(id: UUID)
    func markItemComplete(id: UUID)
}
