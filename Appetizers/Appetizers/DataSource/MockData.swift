//
//  MockData.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import Foundation

struct MockData {
    static let sampleAppetizer = AppetizerItem(
        id: 001,
        name: "Test Appetizer",
        description: "This is the description for my test appetizer",
        price: 9.99,
        imageURL: "asian-flank-steak",
        calories: 99,
        protein: 99,
        carbs: 99
    )
    
    static let firstOrderItem = AppetizerItem(
        id: 001,
        name: "Test Appetizer One",
        description: "This is the description for my test appetizer",
        price: 9.99,
        imageURL: "asian-flank-steak",
        calories: 99,
        protein: 99,
        carbs: 99
    )
    
    static let secondOrderItem = AppetizerItem(
        id: 002,
        name: "Test Appetizer Two",
        description: "This is the description for my test appetizer",
        price: 9.99,
        imageURL: "asian-flank-steak",
        calories: 99,
        protein: 99,
        carbs: 99
    )
    
    static let thrirdOrderItem = AppetizerItem(
        id: 003,
        name: "Test Appetizer Three",
        description: "This is the description for my test appetizer",
        price: 9.99,
        imageURL: "asian-flank-steak",
        calories: 99,
        protein: 99,
        carbs: 99
    )
    
    static let sampleAppetizers: [AppetizerItem] = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
    static let sampleOrders: [AppetizerItem] = [firstOrderItem, secondOrderItem, thrirdOrderItem]
}
