//
//  Alert.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 28/10/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidURL = AlertItem(
        title: Text("Server Error"),
        message: Text("The data received from the server was invalid. Please contact support."),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message: Text("Invalid response from the server. Please try again later or contact support."),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message: Text("There was an issue connecting to the server. Please try again later or contact support."),
        dismissButton: .default(Text("OK"))
    )
    
    static let enabledToComplete = AlertItem(
        title: Text("Server Error"),
        message: Text("Enabled to complete your request at this time. Please check your internet connection"),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidForm = AlertItem(
        title: Text("Invalid Form"),
        message: Text("Please fill out all fields."),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidEmail = AlertItem(
        title: Text("Invalid Email"),
        message: Text("Please enter a valid email address."),
        dismissButton: .default(Text("OK"))
    )
}
