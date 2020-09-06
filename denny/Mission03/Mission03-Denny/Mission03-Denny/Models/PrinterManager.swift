//
//  PrinterManager.swift
//  Mission03-Denny
//
//  Created by Denny on 2020/09/06.
//  Copyright © 2020 KakaoTalk. All rights reserved.
//

import Foundation

public protocol PrinterManagerService {
    func createNewPrinter()
    
    func insertNewTask()
    
    func getPrinterList() -> [Printer]
}

public class PrinterManager: PrinterManagerService {
    public static let shared: PrinterManager = PrinterManager()
    private var printers: [Printer] = [Printer]()
    
    func createNewPrinter() {
        
    }
    
    func insertNewTask() {
        
    }
    
    func getPrinterList() -> [Printer]? {
        return nil
    }
}
