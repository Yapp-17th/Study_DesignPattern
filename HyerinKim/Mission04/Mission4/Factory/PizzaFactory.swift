//
//  PizzaFactory.swift
//  Mission4
//
//  Created by dohan on 23/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation

protocol PizzaFactory {
    func orderPizza(for st: String) -> Pizza
    func madePizza(pizza: Pizza) -> String
}


