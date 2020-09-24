//
//  Pizza.swift
//  Mission4
//
//  Created by dohan on 21/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation

protocol Pizza {
    var name:String { get }
    var dough:String { get }
    var toppings:[String] { get }
    var temp:Int { get }
    var time:Int { get }
    
  
}