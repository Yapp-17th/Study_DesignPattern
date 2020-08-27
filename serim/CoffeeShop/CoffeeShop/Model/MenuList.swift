//
//  MenuList.swift
//  CoffeeShop
//
//  Created by 바보세림이 on 2020/08/09.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

// 싱글톤
class MenuList {
    static let shared = MenuList()
    
    var list: [Menu] = []
    
    private init() {
        list.append(Menu("americano", price: 4000))
        list.append(Menu("latte", price: 4500))
        list.append(Menu("coldBrew", price: 4800))
        list.append(Menu("lemonade", price: 4500))
    }
}
