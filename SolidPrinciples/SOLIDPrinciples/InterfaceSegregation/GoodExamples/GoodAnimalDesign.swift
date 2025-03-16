//
//  GoodAnimalDesign.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

protocol Flyable {
    func fly()
}

protocol Swimmable {
    func swim()
}

protocol Feedable {
    func eat()
}

class FlamingoBirds: Flyable, Swimmable, Feedable  {
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

class RetrieverDogs: Feedable {
    func eat() {
        print("I can eat")
    }
}
