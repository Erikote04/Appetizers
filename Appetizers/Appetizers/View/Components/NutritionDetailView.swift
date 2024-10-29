//
//  NutritionDetailView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 29/10/24.
//

import SwiftUI

struct NutritionDetailView: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.caption.bold())
            
            Text("\(value)")
                .fontWeight(.semibold).italic()
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    NutritionDetailView(title: "Calories", value: MockData.sampleAppetizer.calories)
}
