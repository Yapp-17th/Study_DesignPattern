//
//  Pizza.swift
//  PizzaShop
//
//  Created by 바보세림이 on 2020/09/13.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

enum MainToppingType: String, CaseIterable {
    case sweetPotato, shrimp, bacon
}

enum OptionToppingType: String, CaseIterable {
    case cheeze, pepperoni, olive, pineapple
}

class Pizza: CustomStringConvertible {
    private let dough: String
    private let main: String
    private let option: String
    var description: String {
        return "\(dough) + \(main) + \(option) = 🍕"
    }
    
    init(main: String, option: String) {
        self.dough = "🥯"
        self.main = main
        self.option = option
    }
}
