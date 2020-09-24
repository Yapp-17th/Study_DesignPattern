//
//  SeoulPizzaFactory.swift
//  Mission4
//
//  Created by dohan on 23/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation

class SeoulPizzaFactory: PizzaFactory {
    
        
    func orderPizza(for st: String) -> Pizza {
        print("createSeoulPizza")
        switch st {
        case "cheese":
            return SeoulCheesePizza()
        case "shrimp":
            return SeoulShrimpPizza()
        case "hanriver":
            return SeoulHanriverPizza()
        
        default:
            return SeoulCheesePizza()
        }
    }
    
   
   
}
