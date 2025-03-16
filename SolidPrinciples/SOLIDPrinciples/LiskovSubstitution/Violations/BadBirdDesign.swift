//
//  BadBirdDesign.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

//❌ Violation of Liskov Substitution Principle
//Here’s a wrong example where subclassing breaks expected behavior:

class Bird {
    func fly() {
        print("Flying high!")
    }
}

class Sparrow: Bird {
    
} // ✅ Works fine, as sparrows can fly

class Penguin: Bird {
    override func fly() {
        fatalError("Penguins cannot fly!") // ❌ Violates LSP: Subclass changes expected behavior
    }
}

class BadBirdDesign {
    
    init() {
        // ✅ Works fine
        makeBirdFly(Sparrow())
        
        // ❌ Crashes because Penguin cannot fly
        makeBirdFly(Penguin())
    }
    
    func makeBirdFly(_ bird: Bird) {
        bird.fly()
    }
    
}
