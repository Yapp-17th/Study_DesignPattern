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
    let main: String
    let option: String
    let amount: Int
    
    init(id: String, main: MainTopping, option: OptionTopping) {
        self.id = id
        self.main = main.topping.rawValue
        self.option = option.topping.rawValue
        self.amount = option.amount
    }
    
    func make() -> Pizza {
        let myOption = String(repeating: option, count: amount)
        let pizza = Pizza(main: main, option: myOption)
        return pizza
    }
}
