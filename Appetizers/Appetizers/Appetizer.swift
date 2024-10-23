//
//  Appetizer.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import Foundation

struct AppetizerResponse: Decodable {
    let request: [AppetizerItem]
}

struct AppetizerItem: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}
