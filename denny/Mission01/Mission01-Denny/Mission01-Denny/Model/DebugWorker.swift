//
//  DebugWorker.swift
//  Mission01-Denny
//
//  Created by Denny on 2020/08/14.
//  Copyright © 2020 Denny. All rights reserved.
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
}
