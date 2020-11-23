//
//  Pizza.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/19.
//

import Foundation

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
