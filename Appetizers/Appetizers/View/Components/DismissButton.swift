//
//  DismissButton.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 29/10/24.
//

import SwiftUI

struct DismissButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .padding()
                .foregroundStyle(.black)
                .background(.thinMaterial)
                .clipShape(.circle)
        }.padding()
    }
}

#Preview {
    DismissButton()
}
