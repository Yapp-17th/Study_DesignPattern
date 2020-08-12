//
//  DataModel.swift
//  Mission01-Denny
//
//  Created by Denny on 2020/08/12.
//  Copyright © 2020 Denny. All rights reserved.
//

import Foundation

public enum CoffeeType: Int {
    case americano = 0
    case latte = 1
    case coldBrew = 2
}

public class Order: NSObject {
    var customer: Customer?
    var coffeeType: CoffeeType?
}

public class Customer: NSObject {
    public var customerId: Int64?
}

public class CoffeeMaker: NSObject {
    public func getPendingOrderCount() -> Int {
        return DataContainer.shared.getPendingOrderListCount()
    }
    
    public func insertNewOrder(order: Order) {
        DataContainer.shared.appendPendingOrder(order: order)
    }
}

public class Casher: NSObject {
    
}
