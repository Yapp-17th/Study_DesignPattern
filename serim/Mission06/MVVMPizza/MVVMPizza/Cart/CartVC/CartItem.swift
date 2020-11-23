//
//  CartItem.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/20.
//

import Foundation

class CartItem {
    
    static let shared = CartItem()
    
    private var items = [Pizza]()
    
    subscript(index: Int) -> Pizza {
        return items[index]
    }
    
    private init() { }
    
    func append(item: Pizza) {
        items.append(item)
    }
    
    func remove(at index: Int) {
        items.remove(at: index)
    }
    
    func getNumberOfItems() -> Int {
        return items.count
    }
    
}
