//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import UIKit

protocol NetworkManagerProtocol {
    func getAppetizers(completion: @escaping (Result<[AppetizerItem], AppetizersError>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getAppetizers(completion: @escaping (Result<[AppetizerItem], AppetizersError>) -> Void) {
        guard let url = URL(string: NetworkManager.baseURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
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
    
    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: url)
        
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self?.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        
        task.resume()
    }
}
