//
//  DebugWorker.swift
//  Mission04-Denny
//
//  Created by Denny on 2020/09/14.
//

import Foundation
import NotificationCenter

public protocol DebugWorkerDelegate {
    func updateDebugItemToTableView()
}

public class DebugWorker: NSObject {
    public static let shared: DebugWorker = DebugWorker()
    private override init() { }
    private var logList: [String] = [String]()
    
    public func appendDebugLog(string: String) {
        logList.append(string)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addDebugLog"), object: nil)
    }
    
    public func getLogList() -> [String] {
        return logList
    }
    
    public func clearLogList() {
        logList.removeAll()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addDebugLog"), object: nil)
    }
}
