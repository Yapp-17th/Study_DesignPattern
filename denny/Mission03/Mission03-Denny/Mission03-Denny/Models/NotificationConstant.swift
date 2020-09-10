//
//  NotificationConstant.swift
//  Mission03-Denny
//
//  Copyright © 2020 Denny. All rights reserved.
//

import Foundation

public enum NotificationConstant {
    case printerComplete
    
    public func notification() -> NSNotification.Name {
        switch self {
        case .printerComplete:
            return NSNotification.Name(rawValue: "PrinterComplete")
        }
    }
}
