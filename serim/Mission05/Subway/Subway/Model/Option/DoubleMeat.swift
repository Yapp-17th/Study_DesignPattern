//
//  DoubleMeat.swift
//  Subway
//
//  Created by 바보세림이 on 2020/10/22.
//

import Foundation

class DoubleMeat: ItemDecorator {
    override func getCost() -> Int {
        return super.getCost() + 1500
    }
    
    override func putItem() -> String {
        return super.putItem() + "DoubleMeat "
    }
}
