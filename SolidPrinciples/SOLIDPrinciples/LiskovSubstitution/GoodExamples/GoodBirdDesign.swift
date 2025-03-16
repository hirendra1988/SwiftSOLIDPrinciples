//
//  GoodBirdDesign.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

//✅ Liskov Substitution Principle (LSP) Example in Swift
//Definition: If a class is a subclass of another, it should be able to replace its parent class without breaking the program.
//Liskov Substitution Principle (LTSY) states that when we inherit from a base class, the subclass should not modify the behavior of the base class functions.

//✅ Correct Implementation Using LSP
//To fix this, separate birds into FlyingBird and NonFlyingBird:

protocol BirdProtocol {
    var name: String { get }
}

protocol FlyingBird: BirdProtocol {
    func fly()
}

class FlyingSparrow: FlyingBird {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func fly() {
        print("\(name) is flying high!")
    }
}

class SwimmingPenguin: BirdProtocol {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func swim() {
        print("\(name) is swimming!")
    }
}

class GoodBirdDesign {
    
    init() {
        // ✅ Works fine (Only flying birds are passed)
        let sparrow = FlyingSparrow(name: "Jack")
        makeBirdFly(sparrow)
        
        // ✅ No runtime errors (Penguins are not forced to implement `fly()`)
        let penguin = SwimmingPenguin(name: "Pingu")
        penguin.swim()
        
    }
    
    func makeBirdFly(_ bird: FlyingBird) {
        bird.fly()
    }
    
}
