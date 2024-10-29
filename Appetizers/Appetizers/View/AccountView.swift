//
//  AccountView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import SwiftUI

struct AccountView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var birthDate: Date = Date()
    @State private var hasExtraNapkins: Bool = false
    @State private var hasFrequentRefill: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Personal information") {
                        TextField("First Name", text: $firstName)
                        
                        TextField("Last Name", text: $lastName)
                        
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                        
                        DatePicker("Birth Date", selection: $birthDate, displayedComponents: .date)
                        
                        Button("Save Changes") {
                            
                        }
                    }
                    
                    Section("Request") {
                        Toggle("Extra Napkings", isOn: $hasExtraNapkins)
                        Toggle("Frequent Refill", isOn: $hasFrequentRefill)
                    }
                    .tint(.brandPrimary)
                }
            }
            .navigationTitle("Account")
        }
    }
}

#Preview {
    AccountView()
}
