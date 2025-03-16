//
//  BadAnimalDesign.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

class Cat {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func animalInfo() -> String {
        return "I am Cat and name is \(self.name)"
    }
}

class Fish {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func animalInfo() -> String {
        return "I am fish and name is \(self.name)"
    }
}

class AnimalsInfo {
    func printData() {
        let cats = [Cat(name: "Luna"), Cat(name: "Tina"), Cat(name: "Moon")]
        
        for cat in cats {
            print(cat.animalInfo())
        }
        
        let fishes = [Fish(name: "Ishxan"), Fish(name: "Karas"), Fish(name: "Sterlec"), Fish(name: "fish")]
        for fish in fishes {
            print(fish.animalInfo())
        }
    }
}

class BadAnimalDesign {
    
    init() {
        let infoOfAnimals = AnimalsInfo()
        infoOfAnimals.printData()
    }
    
}
