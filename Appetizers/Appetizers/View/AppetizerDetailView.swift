//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 29/10/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var order: Order
    
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
                    NutritionDetailView(title: "Calories", value: appetizer.calories)
                    NutritionDetailView(title: "Carbs", value: appetizer.carbs)
                    NutritionDetailView(title: "Protein", value: appetizer.protein)
                }
                .padding(.top, 24)
                
                Spacer()
            }
            .overlay(DismissButton(), alignment: .topTrailing)
            
            PrimaryButton(text: "$\(appetizer.price, specifier: "%.2f") - Add to order") {
                order.add(appetizer)
                dismiss()
            }
        }
    }
}

#Preview {
    let order = Order()
    
    AppetizerDetailView(appetizer: MockData.sampleAppetizer)
        .environmentObject(order)
}
