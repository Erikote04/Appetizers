//
//  ContentView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import SwiftUI

struct AppetizersTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                AppetizerListView()
            }
            
            Tab("Order", systemImage: "bag") {
                OrderView()
            }.badge(order.items.count)
            
            Tab("Account", systemImage: "person.fill") {
                ProfileView()
            }
        }
    }
}

#Preview {
    let order = Order()
    
    AppetizersTabView()
        .environmentObject(order)
}
