//
//  Cook.swift
//  PizzaShop
//
//  Created by 바보세림이 on 2020/09/13.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

class PizzaMaker {
    let id: String
    let main: MainToppingType
    let option: [OptionToppingType]?
    
    init(id: String, main: MainToppingMaker, option: OptionToppingMaker) {
        self.id = id
        self.main = main.topping
        self.option = option.toppings
    }
    
    func make() -> Pizza {
        let pizza = Pizza(main: main, option: option)
        return pizza
    }
}
