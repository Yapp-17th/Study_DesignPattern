//
//  MenuList.swift
//  ObservingCafe
//
//  Created by 바보세림이 on 2020/08/24.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

class Menu {
    var menuList: [Coffee] = []
    
    init() {
        let americano = Coffee(.americano, 3500, 1)
        let latte = Coffee(.latte, 4000, 2)
        let coldBrew = Coffee(.coldBrew, 4200, 4)
        let milkTea = Coffee(.milkTea, 4300, 3)
        
        self.menuList.append(americano)
        self.menuList.append(latte)
        self.menuList.append(coldBrew)
        self.menuList.append(milkTea)
    }
}
