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
    var currentDocument: Document? {
        didSet {
            popDocument()
        }
    }
    var extraLine: Int = 0
    var progress = ""
    var delegate: progressDelegate?
    
    private init() {

    }
    
    private func appendDocument(_ document: Document) {
        documentQueue.append(document)
    }
    
    func printDocument(document: Document) {
        appendDocument(document)
        popDocument()
    }
    
    func popDocument() {
        if(currentDocument != nil) { return }
        extraLine = 0
        guard let currentDocument = documentQueue.first else {
            return
        }
        self.currentDocument = currentDocument
        split(document: currentDocument)
    }
    
    func showProgress(document: Document) {
        guard let currentDocument = currentDocument else {
            return
        }
        extraLine += document.line
        progress = "🖨 \(document.title)(\(document.id)) -> \(extraLine)/\(currentDocument.line)"
        if(extraLine == currentDocument.line) {
            documentQueue.removeFirst()
            self.currentDocument = nil
        }
        delegate?.updateProgessLabel(progress)
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
            let newDocument = Document(id: document.id, title: document.title, line: newLine)
            Printer.shared.printDocument(document: newDocument)
        }
    }
}
