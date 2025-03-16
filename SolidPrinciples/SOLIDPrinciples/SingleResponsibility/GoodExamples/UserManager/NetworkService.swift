//
//  SingleResponsibility.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

import Foundation

//The Single Responsibility Principle (SRP) states that a class should have only one reason to change, meaning it should only have one responsibility.

protocol NetworkServiceProtocol {
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}
