//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import SwiftUI

struct AppetizerListView: View {
    @State private var appetizers: [AppetizerItem] = []
    
    var body: some View {
        NavigationStack {
            List(appetizers) { appetizer in
                AppetizerListRowView(appetizer: appetizer)
            }
            .navigationTitle("Appetizers")
            .listStyle(.plain)
        }
        .onAppear {
            getAppetizers()
        }
    }
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    AppetizerListView()
}
