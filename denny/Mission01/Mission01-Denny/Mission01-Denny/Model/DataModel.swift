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

public protocol CasherDelegate {
    func serveCoffee(_ order: Order)
    
    func getMakeStatus(_ content: String)
}

public protocol CustomerDelegate {
    func requestCoffeeOrder(_ order: Order)
}

public protocol CoffeeMakerDelegate {
    func extractCoffee(_ order: Order)
    
    func getMakeStatus(_ content: String)
}



public struct Order {
    public var coffeeType: CoffeeType?
}

public class Customer: NSObject {
    public var customerId: Int64?
    public var delegate: CustomerDelegate?
}

public class CoffeeMaker: NSObject {
    public var delegate: CoffeeMakerDelegate?
    
    public func makeCoffee(order: Order) {
        var statusString = ""
        statusString.append("[커피메이커] 커피를 만들고 있습니다.\n커피타입 : \(order.coffeeType ?? .americano)\n")
        statusString.append("[커피메이커] 커피가 완성되어 내보냅니다.\n커피타입 : \(order.coffeeType ?? .americano)")
        
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
    
    public func requestOrder(coffeeType: CoffeeType) {
        coffeeMaker.makeCoffee(order: Order(coffeeType: coffeeType))
    }
    
    // MARK: CoffeeMaker Delegate
    public func extractCoffee(_ order: Order) {
        let content = "[Casher] 제조된 커피를 받았습니다.\n커피 종류 : \(order.coffeeType ?? .americano)"
        DebugWorker.shared.appendDebugLog(string: content)
        getMakeStatus(content)
        delegate?.serveCoffee(order)
    }
    
    public func getMakeStatus(_ content: String) {
        delegate?.getMakeStatus(content)
    }
    
}
