//
//  AppetizerListRowView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import SwiftUI

struct AppetizerListRowView: View {
    let appetizer: AppetizerItem
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .listRowImage()
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .listRowImage()
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(appetizer.name)
                    .font(.headline)
                
                Text(appetizer.price, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .font(.subheadline.bold())
                    .foregroundStyle(.secondary)
            }
            .padding(.leading, 8)
            
            Spacer()
        }
    }
}

#Preview {
    AppetizerListRowView(appetizer: MockData.sampleAppetizer)
}
