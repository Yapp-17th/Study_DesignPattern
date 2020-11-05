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
    
    func getTitle() -> String {
        return "써브웨이 클럽"
    }
    
    func getDescription() -> String {
        return "세림 최애 메뉴! 너무 맛있어요~"
    }
}
