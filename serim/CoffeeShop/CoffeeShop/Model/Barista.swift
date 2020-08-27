//
//  Barista.swift
//  CoffeeShop
//
//  Created by 바보세림이 on 2020/08/09.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

class Barista {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func make(coffee: Menu) -> Coffee {
        let coffee = Coffee(type: coffee.menu)
        return coffee
    }
}
