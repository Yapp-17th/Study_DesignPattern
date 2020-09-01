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
    
    func print(document: Document) {
        sleep(1)
        showProgress()
    }

    func showProgress() {
        PrinterProxy.shared.showProgress()
    }
}
