//
//  Customer.swift
//  CoffeeShop
//
//  Created by 바보세림이 on 2020/08/09.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

class Customer {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func pickMenu(in list: MenuList) -> Menu {
        let menu = list.list[0]
        return menu
    }
    
    func order(_ menu: Menu, in list: MenuList, to barista: Barista) -> Coffee {
        return barista.make(coffee: menu)
    }
}
