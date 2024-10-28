//
//  AppetizersViewModel.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import SwiftUI

final class AppetizersViewModel: ObservableObject {
    
    // MARK: Published
    @Published var appetizers: [AppetizerItem] = []
    @Published var alertItem: AlertItem?
    
    // MARK: Properties
    private let networkManager: NetworkManager
    
    // MARK: Life cycle
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    // MARK: Functions
    func getAppetizers() {
        networkManager.getAppetizers { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self?.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self?.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self?.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self?.alertItem = AlertContext.invalidData
                    case .enableToConnect:
                        self?.alertItem = AlertContext.enabledToComplete
                    }
                }
            }
        }
    }
}
