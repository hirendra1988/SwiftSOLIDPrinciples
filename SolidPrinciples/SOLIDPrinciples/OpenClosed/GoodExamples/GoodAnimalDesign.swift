//
//  GoodAnimalDesign.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

//Open/Closed Principle (OCP) in Swift
//The Open/Closed Principle (OCP) states:
//🔹 A class should be open for extension but closed for modification.
//This means we should be able to add new functionality without modifying existing code, which helps in maintainability and scalability.

protocol Info {
    var name: String { get }
    func animalInfo() -> String
}

class DomesticCat: Info {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func animalInfo() -> String {
        return "I am Cat and name is \(self.name)"
    }
}

class GoldFish: Info {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func animalInfo() -> String {
        return "I am fish and name is \(self.name)"
    }
}

class AnimalsInfo1 {
    func printData(animalsInfo: [Info]) {
        for info in animalsInfo {
            print(info.animalInfo())
        }
    }
}

class GoodAnimalDesign {
    
    init() {
        let animalsInfo: [Info] = [
            DomesticCat(name: "Luna"),
            DomesticCat(name: "Tina"),
            DomesticCat(name: "Moon"),
            GoldFish(name: "Ishxan"),
            GoldFish(name: "Karas"),
            GoldFish(name: "Sterlec"),
            GoldFish(name: "fish")
        ]
        let infoOfAnimals = AnimalsInfo1()
        infoOfAnimals.printData(animalsInfo: animalsInfo)
    }
    
}
