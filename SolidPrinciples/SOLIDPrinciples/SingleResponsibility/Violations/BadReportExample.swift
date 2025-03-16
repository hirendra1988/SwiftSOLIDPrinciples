//
//  BadReportExample.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

//❌ Violating SRP
//Here, the Report class has two responsibilities:
//Generating the report (generateReport)
//Saving the report (saveToFile)

class Report {
    
    func generateReport() -> String {
        return "Report Data"
    }
    
    func saveToFile(content: String) {
        print("Saving report to file: \(content)")
    }
    
}

