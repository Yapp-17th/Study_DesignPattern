//
//  Pizza.swift
//  PizzaShop
//
//  Created by 바보세림이 on 2020/09/13.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

enum PizzaType {
    case sweetPotato, shrimp, bacon
}

enum ToppingType {
    case cheeze, pepperoni, olive, pineapple
}

class Pizza {
    let ingredients: String
    let topping: String
    init(ingredients: String, topping: String) {
        self.ingredients = ingredients
        self.topping = topping
    }
}
