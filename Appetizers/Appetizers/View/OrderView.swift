//
//  OrderView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import SwiftUI

struct OrderView: View {
    @State private var orderItems = MockData.sampleOrders
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                List {
                    ForEach(orderItems) { appetizer in
                        AppetizerListRowView(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItem)
                }
                .listStyle(.plain)
                
                PrimaryButton(text: "Pay") {
                    // place order
                }
                
                if orderItems.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order.\nPlease add an appetizer.")
                }
            }
            .navigationTitle("Order")
        }
    }
    
    func deleteItem(at index: IndexSet) {
        orderItems.remove(atOffsets: index)
    }
}

#Preview {
    OrderView()
}
