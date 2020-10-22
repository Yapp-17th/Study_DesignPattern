//
//  BLT.swift
//  Subway
//
//  Created by 바보세림이 on 2020/10/22.
//

import Foundation

class BLT: ItemDecorator {
    override func getCost() -> Int {
        return super.getCost() + 4300
    }
    
    override func putItem() -> String {
        return super.putItem() + "B.L.T "
    }

}
