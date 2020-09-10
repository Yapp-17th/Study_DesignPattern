//
//  PrinterProxy.swift
//  Mission03
//
//  Created by dohan on 05/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation


class PrinterProxy: PrinterProtocol{
    
    static var fileQueue:[QueueStruct] = []
    static var logArray:[String] = []
    static var isPrinting = false
    static let shared = PrinterProxy()
    private init(){}
    
    var list = Files.shared.getFileList()
    let printer = Printer.shared
    var count = 0
   
    func addPrintFile(file: Int) {
        //오브젝트 만들어서 큐에 넣음
        let printObject = QueueStruct(index: file, status: "대기중")
        PrinterProxy.fileQueue.append(printObject)
        count += 1
        //요청 로그 찍음
        printLog(file: file)
        if(PrinterProxy.isPrinting == false){
            self.printer.addPrintFile(file: file)
        }
        
        
    }
    
    func printLog(file:Int) {
        PrinterProxy.logArray.append("\(count) >> \(list[file].title) 출력 요청")
        
        print(" \(count) >> \(list[file].title) 출력 요청")
    }
    
    
}
