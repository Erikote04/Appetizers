//
//  AccountView.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName
        case lastName
        case email
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Personal information") {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
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
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
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
