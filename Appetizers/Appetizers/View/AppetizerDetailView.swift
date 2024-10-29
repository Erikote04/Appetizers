//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 29/10/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    let appetizer: AppetizerItem
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                AppetizerRemoteImage(url: appetizer.imageURL)
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                Text(appetizer.name)
                    .font(.title.bold())
                
                Text(appetizer.description)
                    .font(.body)
                    .padding()
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 32) {
                    VStack(spacing: 8) {
                        Text("Calories")
                            .font(.caption.bold())
                        
                        Text("\(appetizer.calories)")
                            .fontWeight(.semibold).italic()
                            .foregroundStyle(.secondary)
                    }
                    
                    VStack(spacing: 8) {
                        Text("Carbs")
                            .font(.caption.bold())
                        
                        Text("\(appetizer.carbs) g")
                            .fontWeight(.semibold).italic()
                            .foregroundStyle(.secondary)
                    }
                    
                    VStack(spacing: 8) {
                        Text("Protein")
                            .font(.caption.bold())
                        
                        Text("\(appetizer.protein) g")
                            .fontWeight(.semibold).italic()
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(.top, 24)
                
                Spacer()
            }
            .overlay(
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .padding()
                        .foregroundStyle(.black)
                        .background(.thinMaterial)
                        .clipShape(.circle)
                }.padding(),
                alignment: .topTrailing
            )
            
            Button {
                // Add to order
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to order")
                    .font(.title3.bold())
                    .padding()
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.brandPrimary)
                    .clipShape(.rect(cornerRadius: 12))
                
            }
            .padding()
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer)
}
