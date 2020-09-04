//
//  LogConfig.swift
//  CoffeeCommon
//
//  Created by Denny on 2020/08/15.
//

import Foundation

public func DebugLog(_ message: @autoclosure () -> String) {
    print("🗣 \(message())")
}

public func ErrorLog(_ message: @autoclosure () -> String) {
    print("🚨 \(message())")
}
