//
//  DebugWorker.swift
//  Mission03-Denny
//
//  Created by denny on 2020/09/11.
//  Copyright © 2020 KakaoTalk. All rights reserved.
//

import Foundation

public class DebugWorker {
    public static let shared: DebugWorker = DebugWorker()
    private var logList: [String] = [String]()
    
    public func appendLog(text: String) {
        logList.append(text)
    }
    
    public func resetLog() {
        logList.removeAll()
    }
    
    public func getLog() -> [String] {
        return self.logList
    }
    
    public func getLogCount() -> Int {
        return self.logList.count
    }
}
