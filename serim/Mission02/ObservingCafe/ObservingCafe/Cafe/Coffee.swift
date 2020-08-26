//
//  Coffee.swift
//  ObservingCafe
//
//  Created by 바보세림이 on 2020/08/24.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

enum CoffeeType: String {
    case americano = "americano"
    case latte = "latte"
    case coldBrew = "coldBrew"
    case milkTea = "milkTea"
}

class Coffee {
    let type: CoffeeType
    let price: Int
    let makingTime: UInt32
    
    init(_ type: CoffeeType, _ price: Int, _ makingTime: UInt32) {
        self.type = type
        self.price = price
        self.makingTime = makingTime
    }
}
