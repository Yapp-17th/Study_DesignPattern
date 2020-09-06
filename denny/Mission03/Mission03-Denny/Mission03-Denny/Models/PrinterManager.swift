//
//  PrinterManager.swift
//  Mission03-Denny
//
//  Copyright © 2020 Denny. All rights reserved.
//

import Foundation

public protocol PrinterManagerService {
    func createNewPrinter()
    
    func insertNewTask(task: PrintTask)
    
    func getPrinterList() -> [Printer]
}

public class PrinterManager: PrinterManagerService {
    public static let shared: PrinterManager = PrinterManager()
    private var printers: [Printer] = [Printer]()
    private var incrementIndex: Int64 = 0
    
    private init() {
        NotificationCenter.default.addObserver(self, selector: #selector(isCompleteTask(_:)), name: NotificationConstant.printerComplete.notification(), object: nil)
    }
    
    @objc
    private func isCompleteTask(_ notification: Notification) {
        let receivedData = notification.userInfo
        print("[PrinterManager] printerId : \(receivedData["printerId"])")
        print("[PrinterManager] completedTask : \(receivedData["task"])")
    }
    
    func createNewPrinter() {
        incrementIndex += 1
        self.printers.append(Printer(id: incrementIndex, bufferSize: Int.random(in: 1..<5)))
    }
    
    private func getFreePrinter() -> Printer? {
        var max: Int = 0
        var bestFreePrinter: Printer?
        self.printers.forEach { printer in
            if max < printer.remainSize {
                max = printer.remainSize
                bestFreePrinter = printer
            }
        }
        return bestFreePrinter
    }
    
    func insertNewTask(task: PrintTask) {
        if let printer = getFreePrinter() {
            printer.insertTask(task: task)
        }
    }
    
    func getPrinterList() -> [Printer]? {
        return nil
    }
}
