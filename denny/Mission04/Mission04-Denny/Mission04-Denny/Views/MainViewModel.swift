//
//  MainViewModel.swift
//  Mission04-Denny
//
//  Created by Denny on 2020/09/14.
//

import Combine
import Foundation

public struct Order {
    
}

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
        
    }
    
    @objc
    private func addDebugLog() {
        self.logList = DebugWorker.shared.getLogList()
    }
}

extension MainViewModel {
    
}
