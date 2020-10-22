//
//  EggMayo.swift
//  Subway
//
//  Created by 바보세림이 on 2020/10/22.
//

import Foundation

class EggMayo: ItemDecorator {
    override func getCost() -> Int {
        return super.getCost() + 3800
    }
    
    override func putItem() -> String {
        return super.putItem() + "EggMayo "
    }
}
