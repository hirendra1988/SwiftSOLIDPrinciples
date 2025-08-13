//
//  GoodReportExample.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

//The Single Responsibility Principle (SRP) states that a class should have only one reason to change, meaning it should only have one responsibility.

protocol PDFDownloading {
    func generateReport() -> String
}

protocol PDFSaving {
    func saveToFile(content: String)
}

class ReportGenerator: PDFDownloading {
    func generateReport() -> String {
        return "Report Data"
    }
}

class ReportSaver: PDFSaving {
    func saveToFile(content: String) {
        print("Saving report to file: \(content)")
    }
}

class GoodReportExample {
    let generator: PDFDownloading
    let saver: PDFSaving
    
    init(generator: PDFDownloading, saver: PDFSaving) {
        self.generator = generator
        self.saver = saver
    }
    
    func run() {
        let reportData = generator.generateReport()
        saver.saveToFile(content: reportData)
    }
    
}

class GoodReportExampleTest {
    
    init() {
        
    }
    
    func test() {
        let report = GoodReportExample(generator: ReportGenerator(),
                                       saver: ReportSaver())
        report.run()
    }
    
}
