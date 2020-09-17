//
//  Printer.swift
//  Mission03
//
//  Created by dohan on 05/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


class Printer: PrinterProtocol{
    
    
    static let shared = Printer()
    
    
    private init() {}
    
    func addPrintFile(file: Int) {
        
        
        startPrint(title: Files.shared.getTitle(row: file))
        
        
        let time = Files.shared.getTime(row: file)
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + .milliseconds(time)) {
            self.printLog(file: file)
            
            //fileQueue의 길이가 0이 될 때까지 재귀적 호출
            
            PrinterProxy.isPrinting = false
            
            
            
        }
    }
    
    //실제 출력
    func startPrint(title: String){
        print("\t\(title) 출력중 ...")
        PrinterProxy.logArray.append("   << \(title) 출력중 ...")
    }
    
    
    func printLog(file: Int) {
        print("    << \(Files.shared.getTitle(row: file)) 출력이 완료되었습니다")
        
        PrinterProxy.logArray.append("   << \(Files.shared.getTitle(row: file)) 출력이 완료되었습니다")
    }
    
    
}
