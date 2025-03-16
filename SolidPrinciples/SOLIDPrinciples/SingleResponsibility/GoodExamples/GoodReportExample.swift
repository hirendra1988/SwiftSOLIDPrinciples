//
//  GoodReportExample.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

//The Single Responsibility Principle (SRP) states that a class should have only one reason to change, meaning it should only have one responsibility.
class ReportGenerator {
    func generateReport() -> String {
        return "Report Data"
    }
}

class ReportSaver {
    func saveToFile(content: String) {
        print("Saving report to file: \(content)")
    }
}

class GoodReportExample {
    
    init() {
        // Usage
        let reportGenerator = ReportGenerator()
        let reportData = reportGenerator.generateReport()
        
        let reportSaver = ReportSaver()
        reportSaver.saveToFile(content: reportData)
    }
    
}
