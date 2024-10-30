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
        ZStack {
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListRowView(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedItem = appetizer
                        }
                }
                .navigationTitle("Appetizers")
                .listStyle(.plain)
            }
            .task {
                viewModel.getAppetizers()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(
                title: alert.title,
                message: alert.message,
                dismissButton: alert.dismissButton
            )
        }
        .fullScreenCover(isPresented: $viewModel.isShowingDetail) {
            AppetizerDetailView(appetizer: viewModel.selectedItem!)
        }
    }
}

#Preview {
    AppetizerListView()
}
