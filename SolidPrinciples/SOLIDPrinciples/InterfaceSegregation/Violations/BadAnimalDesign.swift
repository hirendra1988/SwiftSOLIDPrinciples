//
//  BadAnimalDesign.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

protocol Animals {
    func eat()
    func fly()
    func swim()
}

class Flamingo: Animals {
    func eat() {
        print("I can eat")
    }
    
    func fly() {
        print("I can fly")
    }
    
    func swim() {
        print("I can swim")
    }
}

class Dogs: Animals {
    func eat() {
        print("I can eat")
    }
    
    func fly() {
        print("I cannot fly")
        fatalError()
    }
    
    func swim() {
        print("I cannot swim")
        fatalError()
    }
}
