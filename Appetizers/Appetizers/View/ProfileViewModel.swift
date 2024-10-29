//
//  ProfileViewModel.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 29/10/24.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    // MARK: Published
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var birthDate: Date = Date()
    @Published var hasExtraNapkins: Bool = false
    @Published var hasFrequentRefill: Bool = false
    @Published var alertItem: AlertItem?
    
    // MARK: Properties
    var isValidForm: Bool {
        guard !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    // MARK: Functions
    func saveChanges() {
        guard isValidForm else { return }
    }
}
