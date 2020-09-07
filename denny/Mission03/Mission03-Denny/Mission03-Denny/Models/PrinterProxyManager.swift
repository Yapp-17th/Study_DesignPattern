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
        service = PrinterManager.shared
    }
    
    public func createNewPrinter() {
        service.createNewPrinter()
    }
    
    public func insertNewTask(task: PrintTask) {
        service.insertNewTask(task: task)
    }
    
    public func getPrinterList() -> [Printer]? {
        return service.getPrinterList()
    }
}
