//
//  AnimalSoundMaker.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 16/03/25.
//

// Low-level class: Dog
class Dog {
    func bark() {
        print("Woof!")
    }
}

// Low-level class: PersianCat
class PersianCat {
    func meow() {
        print("Meow!")
    }
}

// High-level class: AnimalSoundMaker
class AnimalSoundMaker {
    let dog: Dog
    let cat: PersianCat
    
    init(dog: Dog, cat: PersianCat) {
        self.dog = dog
        self.cat = cat
    }
    
    func makeDogSound() {
        dog.bark()
    }
    
    func makeCatSound() {
        cat.meow()
    }
}
