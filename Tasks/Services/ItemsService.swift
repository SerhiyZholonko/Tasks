//
//  ItemsService.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import Foundation

class ItemsService: ItemsServiceProtocol {
    // In-memory storage for demo purposes
    private var items: [Item] = [
        Item(title: "Implement Clean Architecture", description: "Create a SwiftUI app using the Clean Swift (VIP) architecture pattern", priority: .high),
        Item(title: "Add Detail View", description: "Create a detailed view for each task with additional information", priority: .medium),
        Item(title: "Write Unit Tests", description: "Add comprehensive unit tests for the business logic components", priority: .low)
    ]
    
    private var completedItemIds = Set<UUID>()
    
    func fetchItems(completion: @escaping (Result<[Item], Error>) -> Void) {
        // Simulate network delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            completion(.success(self.items))
        }
    }
    
    func addItem(_ item: Item, completion: @escaping (Result<Void, Error>) -> Void) {
        // Simulate network delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            self.items.append(item)
            completion(.success(()))
        }
    }
    
    func deleteItem(id: UUID, completion: @escaping (Result<Void, Error>) -> Void) {
        // Simulate network delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            self.items.removeAll { $0.id == id }
            self.completedItemIds.remove(id)
            completion(.success(()))
        }
    }
    
    func markItemComplete(id: UUID, completion: @escaping (Result<Void, Error>) -> Void) {
        // Simulate network delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            if self.completedItemIds.contains(id) {
                self.completedItemIds.remove(id)
            } else {
                self.completedItemIds.insert(id)
            }
            completion(.success(()))
        }
    }
    
    func isItemCompleted(id: UUID) -> Bool {
        return completedItemIds.contains(id)
    }
}
