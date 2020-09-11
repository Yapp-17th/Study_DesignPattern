//
//  NotificationConstant.swift
//  Mission03-Denny
//
//  Copyright © 2020 Denny. All rights reserved.
//

import Foundation

public enum NotificationConstant {
    case printerComplete
    case addLog
    case removeLog
    
    public func notification() -> NSNotification.Name {
        switch self {
        case .printerComplete:
            return NSNotification.Name(rawValue: "PrinterComplete")
        case .addLog:
            return NSNotification.Name(rawValue: "addLog")
        case .removeLog:
            return NSNotification.Name(rawValue: "removeLog")
        }
    }
}
