//
//  GoodShapeDesign.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

//✅ Liskov Substitution Principle (LSP) Example in Swift
//Definition: If a class is a subclass of another, it should be able to replace its parent class without breaking the program.
//Liskov Substitution Principle (LTSY) states that when we inherit from a base class, the subclass should not modify the behavior of the base class functions.

//✅ Correct Implementation of RectangleShape & SquareShape
//Instead of forcing Square to fit into Rectangle, we separate them into distinct shapes.

protocol Shape {
    func area() -> Int
}

class RectangleShape: Shape {
    var width: Int
    var height: Int
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    
    func area() -> Int {
        return width * height
    }
}

class SquareShape: Shape {
    var side: Int
    
    init(side: Int) {
        self.side = side
    }
    
    func area() -> Int {
        return side * side
    }
}

class GoodShapeDesign {
    
    init() {
        // ✅ Works correctly for both Rectangle and Square
        let rect = RectangleShape(width: 5, height: 10)
        let square = SquareShape(side: 5)
        
        printArea(of: rect)   // Output: Area: 50
        printArea(of: square) // Output: Area: 25
    }
    
    func printArea(of shape: Shape) {
        print("Area: \(shape.area())")
    }
    
}
