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
                        TextField("First Name", text: $viewModel.user.firstName)
                        
                        TextField("Last Name", text: $viewModel.user.lastName)
                        
                        TextField("Email", text: $viewModel.user.email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                        
                        DatePicker("Birth Date", selection: $viewModel.user.birthDate, displayedComponents: .date)
                        
                        Button("Save Changes") {
                            viewModel.saveChanges()
                        }
                    }
                    
                    Section("Request") {
                        Toggle("Extra Napkings", isOn: $viewModel.user.hasExtraNapkins)
                        Toggle("Frequent Refill", isOn: $viewModel.user.hasFrequentRefill)
                    }
                    .tint(.accentColor)
                }
            }
            .navigationTitle("Account")
        }
        .onAppear {
            viewModel.retreiveUser()
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
