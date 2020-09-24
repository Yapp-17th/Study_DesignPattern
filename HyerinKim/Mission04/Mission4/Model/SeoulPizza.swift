//
//  SeoulPizza.swift
//  Mission4
//
//  Created by dohan on 21/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation

class SeoulCheesePizza: Pizza {
    
    var name = "서울 치즈 피자 "
    
    var dough: String = "리치 골드 크러스트"
    
    var toppings: [String] = ["모짜렐라 치즈","치즈치즈"]
    
    var temp = 180
    
    var time = 20
    
    
    
    
}

class SeoulShrimpPizza: Pizza {
    
    var name: String = "서울 새우 피자"
    
    var dough: String = "리치 골드 크러스트"
    
    var toppings: [String] = ["모짜렐라", "새우", "올리브"]
    
    var temp = 200
    
    var time = 20
    
    
}

class SeoulHanriverPizza: Pizza {
    var name: String = "서울 한강 피자"
    
    var dough: String = "리치리치 골드 크러스트"
    
    var toppings: [String] = ["치킨","모짜렐라","한강라면맛스프"]
    
    var temp = 185
    
    var time = 20
    
    
}
