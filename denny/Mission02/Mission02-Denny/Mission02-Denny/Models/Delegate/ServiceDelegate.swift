//
//  ServiceDelegate.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/22.
//

import Foundation

public protocol CasherDelegate {
    func serveCoffee(_ customerId: Int64, _ coffee: Coffee)
}

public protocol CustomerDelegate {
    func receiveCoffeeOrder(_ customerId: Int64, _ coffee: Coffee)
}

public protocol CoffeeMakerDelegate {
    func extractCoffee(_ customerId: Int64, _ coffee: Coffee)
    
    func getMakeStatus(_ content: String)
}
