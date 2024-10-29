//
//  Order.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 29/10/24.
//

import SwiftUI

final class Order: ObservableObject {
    
    // MARK: Published
    @Published var items: [AppetizerItem] = []
    
    // MARK: Properties
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    // MARK: Functions
    func add(_ item: AppetizerItem) {
        items.append(item)
    }
    
    func deleteItem(at index: IndexSet) {
        items.remove(atOffsets: index)
    }
}
