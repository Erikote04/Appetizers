//
//  ProfileViewModel.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 29/10/24.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    // MARK: App Storage
    @AppStorage("user") private var userData: Data?
    
    // MARK: Published
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    // MARK: Properties
    var isValidForm: Bool {
        guard !user.firstName.isEmpty, !user.lastName.isEmpty, !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    // MARK: Functions
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSavedSuccesfully
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retreiveUser() {
        guard let userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
}
