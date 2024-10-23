//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationStack {
            List(MockData.sampleAppetizers) { appetizer in
                AppetizerListRowView(appetizer: appetizer)
            }
            .navigationTitle("Appetizers")
            .listStyle(.plain)
        }
    }
}

#Preview {
    AppetizerListView()
}
