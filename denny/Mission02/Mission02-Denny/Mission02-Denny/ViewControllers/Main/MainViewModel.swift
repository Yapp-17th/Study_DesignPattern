//
//  MainViewModel.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/15.
//

import CoffeeCommon
import Combine
import Foundation

public class MainViewModel: NSObject, ObservableObject {
    @Published var title: String = "Test"
    @Published var logList: [String] = [String]()
    
    
    override init() {
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(addDebugLog), name: NSNotification.Name(rawValue: "addDebugLog"), object: nil)
    }
    
    func fetch() {
        let randomNumber = Int.random(in: 0..<50)
        title = "Random number (\(randomNumber))"
    }
    
    func getRandomNumber() -> Int64 {
        return Int64.random(in: 0..<50)
    }
    
    func processOrder(order: Order) {
        DebugLog("Do Order Process... 주문한 커피 : \(order.coffees)")
        MainWorker.shared.doProcessOrder(order: order)
    }
    
    @objc
    private func addDebugLog() {
        self.logList = DebugWorker.shared.getLogList()
    }
}

extension MainViewModel {
    
}
