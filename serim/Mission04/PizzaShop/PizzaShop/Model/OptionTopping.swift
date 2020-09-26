//
//  OptionTopping.swift
//  PizzaShop
//
//  Created by 바보세림이 on 2020/09/26.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

class OptionTopping {
    let topping: OptionToppingType
    let amount: Int
    
    init(topping: OptionToppingType, amount: Int) {
        self.topping = topping
        self.amount = amount
    }
}
