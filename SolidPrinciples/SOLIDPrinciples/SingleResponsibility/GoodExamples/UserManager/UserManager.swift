//
//  UserManager.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

import Foundation

//✅ Advantages of This Approach
//Follows SRP
//
//NetworkService → Fetches data
//UserParser → Decodes data
//DatabaseService → Saves data
//LoggerService → Logs errors
//Easier to Maintain & Extend
//
//If the API changes, modify UserParser.
//If switching from Realm to CoreData, modify DatabaseService.
//More Testable
//
//Mock NetworkServiceProtocol to simulate network failures.
//Mock DatabaseServiceProtocol to test database logic.

class UserManager {
    private let networkService: NetworkServiceProtocol
    private let userParser: UserParserProtocol
    private let databaseService: DatabaseServiceProtocol
    private let logger: LoggerServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService(),
         userParser: UserParserProtocol = UserParser(),
         databaseService: DatabaseServiceProtocol = DatabaseService(),
         logger: LoggerServiceProtocol = LoggerService()) {
        self.networkService = networkService
        self.userParser = userParser
        self.databaseService = databaseService
        self.logger = logger
    }
    
    func fetchAndSaveUser() {
        guard let url = URL(string: "https://api.example.com/user") else { return }
        
        networkService.fetchData(from: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                switch self.userParser.parseUserData(data) {
                case .success(let user):
                    do {
                        try self.databaseService.saveUser(user)
                        self.logger.log("User saved successfully!")
                    } catch {
                        self.logger.log("Database error: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    self.logger.log("Parsing error: \(error.localizedDescription)")
                }
                
            case .failure(let error):
                self.logger.log("Network error: \(error.localizedDescription)")
            }
        }
    }
}
