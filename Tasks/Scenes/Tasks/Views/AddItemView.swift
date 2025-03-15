//
//  AddItemView.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import SwiftUI

struct AddItemView: View {
    @State private var title = ""
    @State private var description = ""
    @State private var priority: Item.Priority = .medium
    @Environment(\.presentationMode) var presentationMode
    let onAdd: (String, String, Item.Priority) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Title", text: $title)
                    
                    TextField("Description", text: $description)
                        .frame(height: 100, alignment: .top)
                        .multilineTextAlignment(.leading)
                }
                
                Section(header: Text("Priority")) {
                    Picker("Priority", selection: $priority) {
                        ForEach(Item.Priority.allCases, id: \.self) { priority in
                            HStack {
                                Circle()
                                    .fill(priority.color)
                                    .frame(width: 12, height: 12)
                                Text(priority.rawValue.capitalized)
                            }
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Button("Add Task") {
                        if !title.isEmpty {
                            onAdd(title, description, priority)
                        }
                    }
                    .disabled(title.isEmpty)
                }
            }
            .navigationTitle("Add New Task")
            .navigationBarItems(
                trailing: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}
