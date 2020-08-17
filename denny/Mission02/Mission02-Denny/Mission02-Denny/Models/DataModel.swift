//
//  DataModel.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/16.
//

import Foundation

public struct Coffee {
    public var coffeeName: String
    public var type: CoffeeType
}

public struct CoffeeOptionItem {
    public var title: String?
    public var options: [Coffee]
}
