//
//  Item.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import SwiftUI


// MARK: - Models
struct Item: Identifiable, Equatable {
    let id: UUID = UUID()
    let title: String
    let description: String
    let createdAt: Date = Date()
    let priority: Priority
    
    enum Priority: String, CaseIterable {
        case low, medium, high
        
        var color: Color {
            switch self {
            case .low: return .green
            case .medium: return .orange
            case .high: return .red
            }
        }
    }
}
