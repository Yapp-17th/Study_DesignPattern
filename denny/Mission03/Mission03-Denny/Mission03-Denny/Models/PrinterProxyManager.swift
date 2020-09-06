//
//  AuthProxy.swift
//  Mission03-Denny
//
//  Created by Denny on 2020/09/06.
//  Copyright © 2020 KakaoTalk. All rights reserved.
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
    
    func insertNewTask() {
        service.insertNewTask()
    }
    
    func getPrinterList() -> [Printer]? {
        return service.getPrinterList()
    }
}
