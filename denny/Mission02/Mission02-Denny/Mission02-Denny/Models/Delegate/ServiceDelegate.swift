//
//  ServiceDelegate.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/22.
//

import Foundation

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
