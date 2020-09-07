//
//  PrinterProxy.swift
//  Mission03
//
//  Created by dohan on 05/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation
import RxSwift


class PrinterProxy: PrinterProtocol{
    
    static let shared = PrinterProxy()
    static var fileQueue:[QueueStruct] = []
    private init(){}

    var list = Files.shared.getFileList()
    let printer = Printer.shared
    var isPrinting = false
    
    
    
    func updateQueue(){
        isPrinting = true
        while(PrinterProxy.fileQueue.count != 0){
            
            self.printer.addPrintFile(file: PrinterProxy.fileQueue[0].index)
            
            PrinterProxy.fileQueue.removeFirst()
            
        }
        isPrinting = false
        
    }
    
    func addPrintFile(file: Int) {
        let printObject = QueueStruct(index: file, status: "대기중")
        PrinterProxy.fileQueue.append(printObject)
        printLog(file: file)
        
        if(isPrinting == false){ updateQueue() }
    }
    
    func printLog(file:Int) {
        print(" >> \(list[file].title) 프린트 요청")
    }
    
    
}
