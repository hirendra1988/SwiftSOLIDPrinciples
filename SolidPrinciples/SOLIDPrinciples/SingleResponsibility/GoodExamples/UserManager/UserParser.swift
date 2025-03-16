//
//  UserParser.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

import Foundation

protocol UserParserProtocol {
    func parseUserData(_ data: Data) -> Result<User, Error>
}

class UserParser: UserParserProtocol {
    func parseUserData(_ data: Data) -> Result<User, Error> {
        do {
            let user = try JSONDecoder().decode(User.self, from: data)
            return .success(user)
        } catch {
            return .failure(error)
        }
    }
}
