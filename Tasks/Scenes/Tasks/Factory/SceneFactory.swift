//
//  SceneFactory.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import Foundation

// MARK: - Factory
enum TasksSceneFactory {
    static func makeItemsScene() -> TasksView {
        let presenter = ItemsPresenter()
        let service = ItemsService()
        let interactor = ItemsInteractor(presenter: presenter, itemsService: service)
        return TasksView(interactor: interactor, presenter: presenter)
    }
    
    static func makeDetailView(for item: Item, interactor: ItemsInteractorLogic) -> ItemDetailView {
        return ItemDetailView(item: item, interactor: interactor)
    }
    static func makeAddItemView(onAdd: @escaping (String, String, Item.Priority) -> Void) -> AddItemView {
        return AddItemView(onAdd: onAdd)
    }
  
}
enum ProfileSceneFactory {
    static func makeProfileScene() -> ProfileView {
        let presenter = ProfilePresenter()
        let service = ProfileService()
        let interactor = ProfileInteractor(presenter: presenter, profileService: service)
        return ProfileView(interactor: interactor, presenter: presenter)
    }
}
