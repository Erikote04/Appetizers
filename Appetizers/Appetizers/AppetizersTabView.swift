//
//  ContentView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import SwiftUI

struct AppetizersTabView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                AppetizerListView()
            }
            
            Tab("Order", systemImage: "bag") {
                OrderView()
            }
            
            Tab("Account", systemImage: "person.fill") {
                AccountView()
            }
        }
        .accentColor(.brandPrimary)
    }
}

#Preview {
    AppetizersTabView()
}
