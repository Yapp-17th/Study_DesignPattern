//
//  BusanPizzaFactory.swift
//  Mission4
//
//  Created by dohan on 23/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation

class BusanPizzaFactory: PizzaFactory{
    func madePizza(pizza: Pizza) -> String {
        return ""
    }
    
    func orderPizza(for st: String) -> Pizza {
        switch st {
        case "cheese":
            return BusanCheesePizza()
        case "shrimp":
            return BusanShrimpPizza()
        case "gookbab":
            return BusanGookbabPizza()
        default:
            return BusanShrimpPizza()
        }
    }
    

}
