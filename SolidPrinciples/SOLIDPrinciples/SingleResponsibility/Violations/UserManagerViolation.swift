//
//  UserManagerViolation.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

import Foundation
import RealmSwift

//❌ Violating SRP
//The class below violates SRP by handling multiple responsibilities:
//
//Fetching data from API
//Parsing JSON
//Saving to database (Realm)
//Logging errors

//🔴 Problems:
//UserManagerViolation is responsible for networking, decoding, database operations, and logging.
//Any change in one responsibility (e.g., switching database or modifying API response) will require modifying this class.
//Harder to unit test individual responsibilities.

class UserManagerViolation {
    let realm = try! Realm()
    
    func fetchUserData() {
        guard let url = URL(string: "https://api.example.com/user") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                
                try self.realm.write {
                    self.realm.add(user)
                }
                
                print("User data saved successfully!")
            } catch {
                print("Error decoding or saving user: \(error.localizedDescription)")
            }
        }.resume()
    }
}

class User: Object, Codable {
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var email: String
    
    // Required init for Realm
    override init() {
        super.init()
    }
    
    // CodingKeys for Codable conformance (if your JSON keys are different)
    private enum CodingKeys: String, CodingKey {
        case id, name, email
    }
}

