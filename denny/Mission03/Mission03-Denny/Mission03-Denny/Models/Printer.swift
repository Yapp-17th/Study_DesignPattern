//
//  Printer.swift
//  Mission03-Denny
//
//  Copyright © 2020 Denny. All rights reserved.
//

import Foundation

public struct PrintTask {
    var documentName: String
    var pages: Int
}

public class Printer {
    private var timer: Timer?
    public var id: Int64
    public var isInsertAvailable: Bool {
        return tasks.count < bufferSize
    }
    
    public var remainSize: Int {
        return bufferSize - tasks.count
    }
    
    public var bufferSize: Int
    private var tasks: [PrintTask] = [PrintTask]()
    
    public init(id: Int64, bufferSize: Int) {
        self.id = id
        self.bufferSize = bufferSize
    }
    
    public func insertTask(task: PrintTask) {
        if tasks.count < 1 {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        }
        tasks.append(task)
    }
    
    private func removeTask() {
        self.tasks.removeFirst()
    }
    
    @objc
    private func timerCallback() {
//        DebugWorker.shared.appendLog(text: "프린트 완료 : \(String(describing: self.tasks.first))")
//        NotificationCenter.default.post(name: NotificationConstant.addLog.notification(), object: nil)
        
        NotificationCenter.default.post(name: NotificationConstant.printerComplete.notification(), object: nil, userInfo: ["printerId": self.id, "task": self.tasks.first])
        removeTask()
        if tasks.count < 1 {
            timer?.invalidate()
        }
    }
}
