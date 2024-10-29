//
//  AppetizersViewModel.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import SwiftUI

@MainActor
final class AppetizersViewModel: ObservableObject {
    
    // MARK: Published
    @Published var appetizers: [AppetizerItem] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var selectedItem: AppetizerItem?
    @Published var isShowingDetail: Bool = false
    
    // MARK: Properties
    private let networkManager: NetworkManager
    
    // MARK: Life cycle
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    // MARK: Functions
    func getAppetizers() {
        isLoading = true
        
        Task {
            do { appetizers = try await networkManager.getAppetizers(); isLoading = false }
            catch {
                if let error = error as? AppetizersError {
                    switch error {
                        case .invalidURL: alertItem = AlertContext.invalidURL
                        case .invalidResponse: alertItem = AlertContext.invalidResponse
                        case .invalidData: alertItem = AlertContext.invalidData
                        case .enableToConnect: alertItem = AlertContext.enabledToComplete
                    }
                } else { alertItem = AlertContext.invalidResponse }
                
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
    }
}
