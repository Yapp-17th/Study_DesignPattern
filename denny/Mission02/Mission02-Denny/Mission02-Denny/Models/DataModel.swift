//
//  DataModel.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/16.
//

import Foundation
import CoffeeCommon

public struct Order {
    public var customerId: Int64
    public var coffees: [Coffee]
    
    public var menuString: String {
        var content = ""
        
        for (index, coffee) in coffees.enumerated() {
            content += coffee.coffeeName
            if index < coffees.count - 1 {
                content += ", "
            }
        }
        
        if content.isEmpty {
            content = "주문한 커피가 없습니다."
        }
        
        return content
    }
}

public struct Coffee {
    public var coffeeName: String
    public var type: CoffeeType
    public var selected: Bool = false
}

public struct CoffeeOptionItem {
    public var title: String?
    public var options: [Coffee]
}
