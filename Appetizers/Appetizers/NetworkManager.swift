//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    private init() {}
    
    func getAppetizers(completion: @escaping (Result<[AppetizerItem], AppetizersError>) -> Void) {
        guard let url = URL(string: NetworkManager.baseURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let _ = error else {
                completion(.failure(.enableToConnect))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let appetizers = try JSONDecoder().decode(AppetizerResponse.self, from: data)
                completion(.success(appetizers.request))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
