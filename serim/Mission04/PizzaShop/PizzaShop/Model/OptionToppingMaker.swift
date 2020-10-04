//
//  OptionTopping.swift
//  PizzaShop
//
//  Created by 바보세림이 on 2020/09/26.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

class OptionToppingMaker {
    let topping: OptionToppingType
    let count: Int
    
    init(topping: OptionToppingType, count: Int) {
        self.topping = topping
        self.count = count
    }
}
