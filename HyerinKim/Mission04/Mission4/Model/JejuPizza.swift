//
//  JejuPizza.swift
//  Mission4
//
//  Created by dohan on 21/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation

class JejuCheesePizza: Pizza {
    var name = "제주 치즈 피자"
    
    var dough: String = "씬 크러스트"
    
    var toppings: [String] = ["모짜렐라 치즈","파마산 치즈","블루 치즈","체다 치즈"]
    
    var temp = 190
    
    var time = 15
    
    
    
}

class JejuShrimpPizza: Pizza {
    var name: String = "제주 새우 피자"
    
    var dough: String = "씬 크러스트"
    
    var toppings: [String] = ["모짜렐라 치즈","제주 딱새우","핫소스"]
    
    var temp = 180
    
    var time = 25
    
    
}

class JejuTangerinePizza: Pizza {
    var name: String = "제주 감귤 피자"
    
    var dough: String = "나폴리"
    
    var toppings: [String] = ["감귤","모짜렐라 치즈","파슬리"]
    
    var temp = 300
    
    var time = 10
    
    
    
}
