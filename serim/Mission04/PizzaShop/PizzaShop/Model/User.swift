//
//  User.swift
//  PizzaShop
//
//  Created by 바보세림이 on 2020/09/13.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

class User {
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    func order(pizzaType: MainToppingType, toppingType: [OptionToppingType]) {
        let orderedPizza = ["pizzaType":pizzaType, "toppingType":toppingType] as [String : Any]
        NotificationCenter.default.post(name: .order, object: nil, userInfo: orderedPizza)
    }
}

extension Notification.Name {
    static let order = Notification.Name("order")
    static let checkOrderList = Notification.Name("checkOrderList")
}
