//
//  FoodForSale.swift
//  PizzaShop
//
//  Created by 바보세림이 on 2020/10/04.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

protocol MainMenu {
    func getName() -> String
    func getPrice() -> Int
}

protocol OptionMenu {
    func getName() -> String
    func getPrice() -> Int
}

