//
//  AccountView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Personal information") {
                        TextField("First Name", text: $viewModel.firstName)
                        
                        TextField("Last Name", text: $viewModel.lastName)
                        
                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                        
                        DatePicker("Birth Date", selection: $viewModel.birthDate, displayedComponents: .date)
                        
                        Button("Save Changes") {
                            viewModel.saveChanges()
                        }
                    }
                    
                    Section("Request") {
                        Toggle("Extra Napkings", isOn: $viewModel.hasExtraNapkins)
                        Toggle("Frequent Refill", isOn: $viewModel.hasFrequentRefill)
                    }
                    .tint(.brandPrimary)
                }
            }
            .navigationTitle("Account")
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(
                title: alert.title,
                message: alert.message,
                dismissButton: alert.dismissButton
            )
        }
    }
}

#Preview {
    ProfileView()
}
