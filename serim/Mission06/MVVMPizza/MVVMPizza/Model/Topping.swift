//
//  Topping.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/19.
//

import Foundation

enum MainToppingType: String, CaseIterable {
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

enum OptionToppingType: String, CaseIterable {
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
