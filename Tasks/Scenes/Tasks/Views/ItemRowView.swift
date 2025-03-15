//
//  ItemRowView.swift
//  testClearArchitecture
//
//  Created by apple on 15.03.2025.
//

import SwiftUI

struct ItemRowView: View {
    let item: Item
    
    var body: some View {
        HStack {
            Circle()
                .fill(item.priority.color)
                .frame(width: 12, height: 12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
        .padding(.vertical, 4)
    }
}
