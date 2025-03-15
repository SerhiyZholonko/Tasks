//
//  TasksView.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import SwiftUI

// MARK: - Views
struct TasksView: View {
    private let interactor: ItemsInteractorLogic
    @ObservedObject private var presenter: ItemsPresenter
    @State private var showingAddItemSheet = false
    
    init(interactor: ItemsInteractorLogic, presenter: ItemsPresenter) {
        self.interactor = interactor
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            Group {
                switch presenter.state {
                case .loading:
                    ProgressView("Loading tasks...")
                
                case .loaded(let items):
                    List {
                        ForEach(items) { item in
                            NavigationLink(destination: TasksSceneFactory.makeDetailView(for: item, interactor: interactor)) {
                                ItemRowView(item: item)
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                interactor.deleteItem(id: items[index].id)
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                    .overlay(
                        Group {
                            if items.isEmpty {
                                Text("No tasks yet. Add some!")
                            }
                        }
                    )
                
                case .error(let message):
                    VStack {
                        Text("Error: \(message)")
                            .foregroundColor(.red)
                        Button("Try Again") {
                            interactor.fetchItems()
                        }
                        .buttonStyle(.bordered)
                        .padding()
                    }
                }
            }
            .navigationTitle("Task List")
            .toolbar {
                Button(action: {
                    showingAddItemSheet = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddItemSheet) {
                TasksSceneFactory.makeAddItemView(
                       onAdd: { title, description, priority in
                           interactor.addItem(title: title, description: description, priority: priority)
                           showingAddItemSheet = false
                       }
                   )
            }
        }
        .onAppear {
            interactor.fetchItems()
        }
    }
}
