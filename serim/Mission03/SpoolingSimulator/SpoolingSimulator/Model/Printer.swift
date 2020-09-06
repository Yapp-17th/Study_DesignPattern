//
//  Printer.swift
//  SpoolingSimulator
//
//  Created by 바보세림이 on 2020/09/02.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

class Printer: PrinterProtocol {

    static let shared = Printer()
    
    private init() { }
    
    func printDocument(document: Document) {
        sleep(1)
        showProgress(document: document)
    }

    func showProgress(document: Document) {
        PrinterProxy.shared.showProgress(document: document)
    }
}
