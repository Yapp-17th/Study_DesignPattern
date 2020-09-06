//
//  NotificationConstant.swift
//  Mission03-Denny
//
//  Created by Denny on 2020/09/07.
//  Copyright © 2020 KakaoTalk. All rights reserved.
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
