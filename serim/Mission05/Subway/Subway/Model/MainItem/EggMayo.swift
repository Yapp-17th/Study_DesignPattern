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
    
    func getTitle() -> String {
        return "에그먀요"
    }
    
    func getDescription() -> String {
        return "달걀과 고소한 마요네즈가 만나 어쩌구"
    }
}
