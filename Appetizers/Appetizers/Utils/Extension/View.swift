//
//  View.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 30/10/24.
//

import SwiftUI

extension View {
    func listRowImage() -> some View {
        modifier(ListRowImage())
    }
}

struct ListRowImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(width: 120, height: 90)
    }
}
