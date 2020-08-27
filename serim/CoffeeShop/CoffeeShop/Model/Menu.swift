//
//  Menu.swift
//  CoffeeShop
//
//  Created by 바보세림이 on 2020/08/09.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

class Menu {
    var menu: String
    var price : Int
    
    init(_ menu: String, price: Int) {
        self.menu = menu
        self.price = price
    }
}
