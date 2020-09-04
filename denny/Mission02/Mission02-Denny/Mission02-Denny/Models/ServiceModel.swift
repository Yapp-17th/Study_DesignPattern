//
//  ServiceModel.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/22.
//

import Foundation
import CoffeeCommon

public class Customer: NSObject, CasherDelegate {
    public var customerId: Int64 = 0
    public var delegate: CustomerDelegate?
    private var casher: Casher = Casher.shared
    
    public init(customerId: Int64) {
        super.init()
        self.customerId = customerId
        self.casher.delegate = self
    }
    
    public func requestCoffeeOrder(order: Order) {
        var content = "손님(#\(order.customerId)) 주문!\nMENU : \(order.menuString)"
        DebugLog(content)
        DebugWorker.shared.appendDebugLog(string: content)
        
        for coffee in order.coffees {
            content = "[Casher] 커피메이커에게 주문을 전달합니다.... 커피 : \(coffee.coffeeName)"
            DebugLog(content)
            DebugWorker.shared.appendDebugLog(string: content)
            casher.requestOrder(customerId: customerId, coffees: order.coffees)
        }
    }
    
    public func serveCoffee(_ customerId: Int64, _ coffee: Coffee) {
        let content = "손님(id:\(customerId))Enjoy Coffee 메뉴 : \(coffee.coffeeName)"
        DebugLog(content)
        DebugWorker.shared.appendDebugLog(string: content)
    }
}

public class CoffeeMaker: NSObject {
    public var delegate: CoffeeMakerDelegate?
    
    public func makeCoffee(customerId: Int64, coffee: Coffee) {
        var statusString = ""
        statusString.append("[커피메이커] 커피를 만들고 있습니다.\n메뉴 : \(coffee.coffeeName)\n")
        statusString.append("[커피메이커] 커피가 완성되어 내보냅니다.\n메뉴 : \(coffee.coffeeName)")
        
        DebugLog(statusString)
        DebugWorker.shared.appendDebugLog(string: statusString)
        delegate?.getMakeStatus(statusString)
        delegate?.extractCoffee(customerId, coffee)
    }
}

// MARK: Casher
public class Casher: NSObject, CoffeeMakerDelegate {
    public static let shared: Casher = Casher()
    public var delegate: CasherDelegate?
    public var customerDelegate: CustomerDelegate?
    
    private var coffeeMaker: CoffeeMaker = CoffeeMaker()
    
    public override init() {
        super.init()
        coffeeMaker.delegate = self
    }
    
    public func requestOrder(customerId: Int64, coffees: [Coffee]) {
        for coffee in coffees {
            coffeeMaker.makeCoffee(customerId: customerId, coffee: coffee)
        }
    }
    
    // MARK: CoffeeMaker Delegate
    public func extractCoffee(_ customerId: Int64, _ coffee: Coffee) {
        let content = "[Casher] 제조된 커피를 받았습니다.\n손님(id:\(customerId)) / 메뉴 : \(coffee.coffeeName)"
        DebugLog(content)
        DebugWorker.shared.appendDebugLog(string: content)
        delegate?.serveCoffee(customerId, coffee)
    }
    
    public func getMakeStatus(_ content: String) {
        
    }
    
}
