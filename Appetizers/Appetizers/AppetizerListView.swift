//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizersViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.appetizers) { appetizer in
                AppetizerListRowView(appetizer: appetizer)
            }
            .navigationTitle("Appetizers")
            .listStyle(.plain)
        }
        .onAppear {
            viewModel.getAppetizers()
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(
                title: alert.title,
                message: alert.message,
                dismissButton: alert.dismissButton
            )
        }
    }
}

#Preview {
    AppetizerListView()
}
