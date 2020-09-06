//
//  PrinterProxy.swift
//  SpoolingSimulator
//
//  Created by 바보세림이 on 2020/09/02.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

class PrinterProxy: PrinterProtocol {
    
    static let shared = PrinterProxy()

    var documentQueue: [Document] = []
    var currentDocument: Document?
    var extraLine: Int = 0
    
    private init() { }
    
    private func appendDocument(_ document: Document) {
        documentQueue.append(document)
    }
    
    func printDocument(document: Document) {
        appendDocument(document)
        if(currentDocument == nil) {
            extraLine = 0
            currentDocument = documentQueue.first!
            split(document: documentQueue.first!)
        }
    }
    
    func showProgress(document: Document) {
        guard let currentDocument = currentDocument else {
            return
        }
        extraLine += document.line
        print("\(document.id)의 진행 상황 : \(extraLine)/\(currentDocument.line)")
    }
    
    private func split(document: Document) {
        var line = document.line
        for _ in 0...line/10 {
            if(line == 0) { break }
            var newLine = 0
            if(line / 10 > 0) {
                line -= 10
                newLine = 10
            } else {
                newLine = line % 10
            }
            let newDocument = Document(id: document.id, document.title, line: newLine)
            Printer.shared.printDocument(document: newDocument)
        }
    }
}
