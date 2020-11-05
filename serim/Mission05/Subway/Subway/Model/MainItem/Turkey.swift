//
//  Turkey.swift
//  Subway
//
//  Created by 바보세림이 on 2020/10/22.
//

import Foundation

class Turkey: ItemDecorator {
    override func getCost() -> Int {
        return super.getCost() + 4000
    }
    
    override func putItem() -> String {
        return super.putItem() + "Turkey "
    }

    func getTitle() -> String {
        return "터키"
    }
    
    func getDescription() -> String {
        return "280kcal로 슬림하게 즐기는 이것도 존맛"
    }
}
