//
//  BusanPizza.swift
//  Mission4
//
//  Created by dohan on 21/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation

class BusanCheesePizza: Pizza {
    
    var name = "부산 치즈 피자"
    
    var dough: String = "고구마 크러스트"
    
    var toppings: [String] = ["모짜렐라 치즈","브리 치즈","까망베르 치즈", "핫소스"]
    
    var temp = 210
    
    var time = 15
    
    
    
}

class BusanShrimpPizza: Pizza {
    var name: String = "부산 새우 피자"
    
    var dough: String = "치즈 크러스트"
    
    var toppings: [String] = ["부산 꽃새우","모짜렐라 치즈", "페퍼로니"]
    
    var temp = 200
    
    var time = 15
    
    
    
}

class BusanGookbabPizza: Pizza {
    var name: String = "부산 국밥 피자"
    
    var dough: String = "치즈 크러스트"
    
    var toppings: [String] = ["돼지고기", "블루 치즈", "후추", "파" ]
    
    var temp = 250
    
    var time = 25
    
    
    
}
