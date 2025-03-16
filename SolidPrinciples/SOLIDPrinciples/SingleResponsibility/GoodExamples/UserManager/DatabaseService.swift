//
//  DatabaseService.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

import RealmSwift

protocol DatabaseServiceProtocol {
    func saveUser(_ user: User) throws
}

class DatabaseService: DatabaseServiceProtocol {
    let realm = try! Realm()
    
    func saveUser(_ user: User) throws {
        try realm.write {
            realm.add(user)
        }
    }
}
