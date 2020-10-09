//
//  Manager.swift
//  PizzaShop
//
//  Created by 바보세림이 on 2020/09/13.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

class Manager {
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(checkOrder(_:)), name: .order, object: nil)
    }
    
    @objc func checkOrder(_ notification: Notification) {
        guard let pizzaType = notification.userInfo?["pizzaType"] as? MainToppingType else { return }
        guard let toppings = notification.userInfo?["toppingType"] as? [OptionToppingType] else { return }
        // guard let countOfTopping = notification.userInfo?["count"] as? Int else { return }
        let pizzaMaker = PizzaMaker(id: "1", main: MainToppingMaker(topping: pizzaType), option: OptionToppingMaker(toppings: toppings))
        let pizza = pizzaMaker.make()
        print(pizza)
    }
}
