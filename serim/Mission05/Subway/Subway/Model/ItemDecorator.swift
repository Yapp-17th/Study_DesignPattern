//
//  FoodDecorator.swift
//  Subway
//
//  Created by 바보세림이 on 2020/10/22.
//

import Foundation

protocol Item {
    func getCost() -> Int
    func putItem() -> String
}

class Bread: Item {
    func getCost() -> Int {
        return 0
    }
    
    func putItem() -> String {
        return "Bread "
    }
}

class ItemDecorator: Item {
    var decoratedItem: Item
    
    init(item: Item) {
        self.decoratedItem = item
    }
    
    func getCost() -> Int {
        return decoratedItem.getCost()
    }
    
    func putItem() -> String {
        return decoratedItem.putItem()
    }
}
