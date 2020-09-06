//
//  AuthProxy.swift
//  Mission03-Denny
//
//  Copyright © 2020 Denny. All rights reserved.
//

import Foundation

public class PrinterProxyManager: PrinterManagerService {
    public static let shared: PrinterProxyManager = PrinterProxyManager()
    private var service: PrinterManagerService
    
    private init() {
        service = PrinterManager()
    }
    
    func createNewPrinter() {
        service.createNewPrinter()
    }
    
    func insertNewTask(task: PrintTask) {
        service.insertNewTask()
    }
    
    func getPrinterList() -> [Printer]? {
        return service.getPrinterList()
    }
}
