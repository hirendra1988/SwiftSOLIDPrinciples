//
//  GoodPaymentExample.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

//Open/Closed Principle (OCP) in Swift
//The Open/Closed Principle (OCP) states:
//🔹 A class should be open for extension but closed for modification.
//This means we should be able to add new functionality without modifying existing code, which helps in maintainability and scalability.

//✅ Good Example (Following OCP)
//We will use protocols & polymorphism to make the system open for extension but closed for modification.

//1️⃣ Define a Payment Protocol

protocol PaymentMethod {
    func pay(amount: Double)
}

//2️⃣ Implement Payment Methods
class CreditCardPayment: PaymentMethod {
    func pay(amount: Double) {
        print("Processing Credit Card payment of $\(amount)")
    }
}

class PayPalPayment: PaymentMethod {
    func pay(amount: Double) {
        print("Processing PayPal payment of $\(amount)")
    }
}

// Adding a new payment method is easy! (e.g., Apple Pay)
class ApplePayPayment: PaymentMethod {
    func pay(amount: Double) {
        print("Processing Apple Pay payment of $\(amount)")
    }
}

//3️⃣ Modify PaymentProcessor to Use Polymorphism
//Now, PaymentProcessor does not need to change when we add new payment methods. 🚀
class SecurePaymentProcessor {
    private let paymentMethod: PaymentMethod
    
    init(paymentMethod: PaymentMethod) {
        self.paymentMethod = paymentMethod
    }
    
    func process(amount: Double) {
        paymentMethod.pay(amount: amount)
    }
}

//✅ Now, if we want to add Google Pay, we just create a new class (GooglePayPayment) without modifying existing code.
class GoodPaymentExample {
    
    init() {
        let creditCardPayment = SecurePaymentProcessor(paymentMethod: CreditCardPayment())
        creditCardPayment.process(amount: 100.0)
        
        let payPalPayment = SecurePaymentProcessor(paymentMethod: PayPalPayment())
        payPalPayment.process(amount: 50.0)
        
        let applePayPayment = SecurePaymentProcessor(paymentMethod: ApplePayPayment())
        applePayPayment.process(amount: 75.0)
        
        
        // Using Strategy Pattern
        // Usage
        let processor = BasicPaymentProcessor(paymentMethod: CreditCardPayment())
        processor.process(amount: 100.0)
        
        // Dynamically switch to PayPal
        processor.setPaymentMethod(PayPalPayment())
        processor.process(amount: 50.0)
    }
    
}

//🎯 Alternative Designs
//1️⃣ Strategy Pattern (Better for Dynamically Changing Payment Methods)
//If we want to change the payment method dynamically, we can use a setter instead of a fixed initializer injection.

class BasicPaymentProcessor {
    private var paymentMethod: PaymentMethod
    
    init(paymentMethod: PaymentMethod) {
        self.paymentMethod = paymentMethod
    }
    
    func setPaymentMethod(_ method: PaymentMethod) {
        self.paymentMethod = method
    }
    
    func process(amount: Double) {
        paymentMethod.pay(amount: amount)
    }
}
