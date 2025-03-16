//
//  BadShapeDesign.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

//❌ Example 1: LSP Violation – Rectangle vs. Square
//Here, Square incorrectly modifies the behavior of Rectangle.

//🚨 Why is this a Violation?
//Square overrides width and height in a way that breaks expected behavior.
//When we set width = 5 and height = 10, a square should still be a square (width == height), leading to unexpected results.

class Rectangle {
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

class Square: Rectangle {
    override var width: Int {
        didSet {
            super.height = width
        }
    }
    
    override var height: Int {
        didSet {
            super.width = height
        }
    }
}

class BadShapeDesign {
    
    init() {
        // ✅ Works fine for Rectangle
        let rect = Rectangle(width: 5, height: 10)
        printArea(of: rect) // Output: Area: 50
        
        // ❌ Unexpected behavior for Square (5×10 should not be 100!)
        let square = Square(width: 5, height: 5)
        printArea(of: square) // Output: Area: 100 (Incorrect!)
    }
    
    func printArea(of rectangle: Rectangle) {
        rectangle.width = 5
        rectangle.height = 10
        print("Area: \(rectangle.area())")
    }
    
}
