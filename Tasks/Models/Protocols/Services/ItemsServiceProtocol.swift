//
//  ItemsServiceProtocol.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import Foundation

// MARK: - Service Layer
protocol ItemsServiceProtocol {
    func fetchItems(completion: @escaping (Result<[Item], Error>) -> Void)
    func addItem(_ item: Item, completion: @escaping (Result<Void, Error>) -> Void)
    func deleteItem(id: UUID, completion: @escaping (Result<Void, Error>) -> Void)
    func markItemComplete(id: UUID, completion: @escaping (Result<Void, Error>) -> Void)
}
