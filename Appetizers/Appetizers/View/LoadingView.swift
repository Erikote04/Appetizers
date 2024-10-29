//
//  LoadingView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 28/10/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
            
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.accentColor)
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView()
}
