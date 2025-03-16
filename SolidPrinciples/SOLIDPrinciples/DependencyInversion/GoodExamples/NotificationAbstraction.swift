//
//  NotificationAbstraction.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 16/03/25.
//

//Dependency Inversion Principle (DIP)
//The Dependency Inversion Principle (DIP) states:
//
//"High-level modules should not depend on low-level modules. Both should depend on abstractions."
//"Abstractions should not depend on details. Details should depend on abstractions."

//✅ Good Example (Following DIP)
//Instead of directly depending on EmailNotifier, we introduce an abstraction (NotificationService).

//🎯 Why is this better?
//✔️ UserAccountService depends on the abstraction (NotificationService), not a specific implementation.
//✔️ Easier to extend (e.g., add PushNotification without modifying UserAccountService).
//✔️ Follows DIP by ensuring high-level modules do not directly depend on low-level modules.

protocol NotificationService {
    func send(message: String)
}

class EmailNotifier: NotificationService {
    func send(message: String) {
        print("Sending email: \(message)")
    }
}

class SMSNotification: NotificationService {
    func send(message: String) {
        print("Sending SMS: \(message)")
    }
}

class UserAccountService {
    let notificationService: NotificationService
    
    init(notificationService: NotificationService) {
        self.notificationService = notificationService
    }
    
    func registerUser() {
        print("User registered")
        notificationService.send(message: "Welcome!")
    }
}
