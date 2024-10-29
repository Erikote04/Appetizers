//
//  OrderView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                List {
                    ForEach(order.items) { appetizer in
                        AppetizerListRowView(appetizer: appetizer)
                    }
                    .onDelete(perform: order.deleteItem)
                }
                .listStyle(.plain)
                
                PrimaryButton(text: "$\(order.totalPrice, specifier: "%.2f") - Place Order") {
                    // place order
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order.\nPlease add an appetizer.")
                }
            }
            .navigationTitle("Order")
        }
    }
}

#Preview {
    let order = Order()
    
    OrderView()
        .environmentObject(order)
}
