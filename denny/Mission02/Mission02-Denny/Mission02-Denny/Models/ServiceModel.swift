//
//  ServiceModel.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/22.
//

import Foundation

public class Customer: NSObject {
    public var customerId: Int64?
    public var delegate: CustomerDelegate?
}

public class CoffeeMaker: NSObject {
    public var delegate: CoffeeMakerDelegate?
    
    public func makeCoffee(order: Order) {
        var statusString = ""
        statusString.append("[커피메이커] 커피를 만들고 있습니다.\n메뉴 : \(order.coffees)\n")
        statusString.append("[커피메이커] 커피가 완성되어 내보냅니다.\n메뉴 : \(order.coffees)")
        
        DebugWorker.shared.appendDebugLog(string: statusString)
        delegate?.getMakeStatus(statusString)
        delegate?.extractCoffee(order)
    }
}

// MARK: Casher
public class Casher: NSObject, CoffeeMakerDelegate {
    public static let shared: Casher = Casher()
    public var delegate: CasherDelegate?
    
    private var coffeeMaker: CoffeeMaker = CoffeeMaker()
    
    public override init() {
        super.init()
        coffeeMaker.delegate = self
    }
    
    public func requestOrder(customerId: Int64, coffees: [Coffee]) {
        coffeeMaker.makeCoffee(order: Order(customerId: customerId, coffees: coffees))
    }
    
    // MARK: CoffeeMaker Delegate
    public func extractCoffee(_ order: Order) {
        let content = "[Casher] 제조된 커피를 받았습니다.\n메뉴 : \(order.coffees)"
        DebugWorker.shared.appendDebugLog(string: content)
        getMakeStatus(content)
        delegate?.serveCoffee(order)
    }
    
    public func getMakeStatus(_ content: String) {
        delegate?.getMakeStatus(content)
    }
    
}
