//
//  JejuPizzaFactory.swift
//  Mission4
//
//  Created by dohan on 23/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation


class JejuPizzaFactory: PizzaFactory{
    
    func orderPizza(for st: String) -> Pizza {
        print("createJejuPizza")
        switch st {
        case "cheese":
            return JejuCheesePizza()
        case "shrimp":
            return JejuShrimpPizza()
        case "tangerine":
            return JejuTangerinePizza()
        default:
            return JejuCheesePizza()
        }
    }
    
    
    
    
    
}