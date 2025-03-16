//
//  LoggerService.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

import Foundation

protocol LoggerServiceProtocol {
    func log(_ message: String)
}

class LoggerService: LoggerServiceProtocol {
    func log(_ message: String) {
        print("[LOG]: \(message)")
    }
}

