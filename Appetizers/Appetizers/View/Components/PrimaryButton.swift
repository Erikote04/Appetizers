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
                .padding()
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
                .clipShape(.rect(cornerRadius: 12))
            
        }
        .buttonStyle(.bordered)
        .tint(.accentColor)
        .padding()
    }
}

#Preview {
    PrimaryButton(text: "Add to order") { }
}
