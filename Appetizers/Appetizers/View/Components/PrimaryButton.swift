//
//  PrimaryButton.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 29/10/24.
//

import SwiftUI

struct PrimaryButton: View {
    let text: LocalizedStringKey
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
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

#Preview {
    PrimaryButton(text: "Add to order") { }
}
