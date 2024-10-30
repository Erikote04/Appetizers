//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 23/10/24.
//

import UIKit

protocol NetworkManagerProtocol {
    func getAppetizers() async throws -> [AppetizerItem]
}

final class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    private let cache = NSCache<NSString, UIImage>()
    
    init() {}
    
    func getAppetizers() async throws -> [AppetizerItem] {
        guard let url = URL(string: NetworkManager.baseURL) else { throw AppetizersError.invalidURL }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            return try JSONDecoder().decode(AppetizerResponse.self, from: data).request
        } catch {
            throw AppetizersError.invalidData
        }
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
