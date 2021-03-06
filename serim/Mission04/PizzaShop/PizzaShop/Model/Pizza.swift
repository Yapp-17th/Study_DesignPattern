//
//  Pizza.swift
//  PizzaShop
//
//  Created by 바보세림이 on 2020/09/13.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

enum MainToppingType: String, CaseIterable, MainMenu {
    case sweetPotato, shrimp, bacon
    
    func getName() -> String {
        return self.rawValue
    }
    
    func getPrice() -> Int {
        switch self {
        case .sweetPotato:
            return 13000
        case .shrimp:
            return 15000
        case .bacon:
            return 16000
        }
    }
}

enum OptionToppingType: String, CaseIterable, OptionMenu {
    case cheeze, pepperoni, olive, pineapple
    
    func getName() -> String {
        return self.rawValue
    }
    
    func getPrice() -> Int {
        switch self {
        case .cheeze:
            return 2000
        case .pepperoni:
            return 2500
        case .olive:
            return 1000
        case .pineapple:
            return 1200
        }
    }

}

class Pizza: CustomStringConvertible {
    var main: MainToppingType
    var option: [OptionToppingType]?
    
    private let dough: String
    
    var description: String {
        guard let option = option else { return "\(dough) + \(main) = 🍕"}
        return "\(dough) + \(main) + \(option) = 🍕"
    }
    
    init(main: MainToppingType, option: [OptionToppingType]?) {
        self.dough = "🥯"
        self.main = main 
        self.option = option
    } 
}
