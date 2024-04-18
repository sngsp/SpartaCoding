//
//  APIManager.swift
//  temptemptemp
//
//  Created by Seungseop Lee on 4/9/24.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    // URL뒤에 id를 붙여 제품을 불러오는 매서드
    func fetchProduct(withId id: Int, completion: @escaping (Result<Product, Error>) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products/\(id)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        // URL세션 활용
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let productData = try decoder.decode(ProductData.self, from: data)
                let product = Product(id: productData.id,
                                      title: productData.title,
                                      descriptionText: productData.description,
                                      price: productData.price,
                                      thumbnail: productData.thumbnail)
                completion(.success(product))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

struct ProductData: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let thumbnail: String
}
