//
//  Printer.swift
//  Mission03
//
//  Created by dohan on 05/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation

class Printer: PrinterProtocol{
    static let shared = Printer()
    
    private init() {}
    
    func addPrintFile(file: Int) {
        PrinterProxy.fileQueue[0].status = "출력중"
        print(" >> \(Files.shared.getTitle(row: file)) 출력중 ...")
        let time = Files.shared.getTime(row: PrinterProxy.fileQueue[0].index)
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + .milliseconds(time)) {
            self.printLog(file: file)
        }
    }
    
    func printLog(file: Int) {
        print(" >> \(Files.shared.getTitle(row: file)) 출력이 완료되었습니다")
    }
    
    
}
