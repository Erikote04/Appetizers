//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizersTabView()
                .environmentObject(order)
        }
    }
}
