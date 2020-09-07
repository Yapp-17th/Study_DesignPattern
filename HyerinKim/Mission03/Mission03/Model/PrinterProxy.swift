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
    
    static var fileQueue:[QueueStruct] = []
    static var isPrinting = false
    static let shared = PrinterProxy()
    private init(){}

    var list = Files.shared.getFileList()
    let printer = Printer.shared
    
    
    
    
    func updateQueue(){
    
        
    }
    
    func addPrintFile(file: Int) {
        //오브젝트 만들어서 큐에 넣음
        let printObject = QueueStruct(index: file, status: "대기중")
        PrinterProxy.fileQueue.append(printObject)
        //요청 로그 찍음
        printLog(file: file)
        
        while(PrinterProxy.isPrinting == false){ self.printer.addPrintFile(file: PrinterProxy.fileQueue[0].index) }
    }
    
    func printLog(file:Int) {
        print(" >> \(list[file].title) 프린트 요청")
    }
    
    
}
