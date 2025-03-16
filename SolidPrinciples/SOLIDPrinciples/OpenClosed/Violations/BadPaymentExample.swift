//
//  BadPaymentExample.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

//❌ Bad Example (Violating OCP)
//This code violates OCP because every time we introduce a new payment method, we have to modify the existing PaymentProcessor class, which is risky.

//🔴 Problems:
//If we want to add Apple Pay or Google Pay, we need to modify PaymentProcessor, which violates OCP.
//More payment methods = More if-else conditions, making the class hard to maintain.

class PaymentProcessor {
    func processPayment(method: String, amount: Double) {
        if method == "CreditCard" {
            print("Processing Credit Card payment of $\(amount)")
        } else if method == "PayPal" {
            print("Processing PayPal payment of $\(amount)")
        } else {
            print("Unsupported payment method")
        }
    }
}

class BadPaymentExample {
    
    init() {
        // Usage
        let processor = PaymentProcessor()
        processor.processPayment(method: "CreditCard", amount: 100.0)
        processor.processPayment(method: "PayPal", amount: 50.0)
    }
    
}
