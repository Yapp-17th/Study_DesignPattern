//
//  Club.swift
//  Subway
//
//  Created by 바보세림이 on 2020/10/22.
//

import Foundation

class Club: ItemDecorator {
    override func getCost() -> Int {
        return super.getCost() + 4500
    }
    
    override func putItem() -> String {
        return super.putItem() + "Club "
    }
}
