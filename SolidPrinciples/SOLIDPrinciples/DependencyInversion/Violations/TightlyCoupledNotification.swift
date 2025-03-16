//
//  TightlyCoupledNotification.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 16/03/25.
//

//🚨 Bad Example (Violating DIP)
//Here, the EmailNotification class is tightly coupled with UserService, making it hard to replace or extend.

//🔴 Problems:
//UserService depends directly on EmailNotification, making it hard to switch to SMS or Push notifications.
//Violates DIP because a high-level module (UserService) depends on a low-level module (EmailNotification).

class EmailNotification {
    func sendEmail(message: String) {
        print("Sending email: \(message)")
    }
}

class UserService {
    let emailNotification = EmailNotification() // ❌ Tight coupling
    
    func registerUser() {
        print("User registered")
        emailNotification.sendEmail(message: "Welcome!")
    }
}
