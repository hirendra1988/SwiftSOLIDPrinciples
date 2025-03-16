//
//  AnimalSoundAbstraction.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 16/03/25.
//

// Abstraction: Animal
protocol Animal {
    func makeSound()
}

// Low-level class: Bulldog
class Bulldog: Animal {
    func makeSound() {
        print("Woof!")
    }
}

// Low-level class: SiameseCat
class SiameseCat: Animal {
    func makeSound() {
        print("Meow!")
    }
}

// High-level class: AnimalSoundPlayer
class AnimalSoundPlayer {
    let animal: Animal
    
    init(animal: Animal) {
        self.animal = animal
    }
    
    func performSound() {
        animal.makeSound()
    }
}
