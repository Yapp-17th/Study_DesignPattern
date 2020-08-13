//
//  MainContract.swift
//  Mission01-Denny
//
//  Created by Denny on 2020/08/12.
//  Copyright © 2020 Denny. All rights reserved.
//

import Foundation

public protocol MainPresenterProtocol {
    func attachView(view: MainViewProtocol)
    
    func appendDebugLog(content: String)
    
    func requestCoffeeOrder(coffeeType: CoffeeType)
}

public protocol MainViewProtocol {
    func setNavigationBarContent(title: String)
    
    func updateDebugLog(content: String)
}

public protocol MainModelProtocol {
    func appendNewLog(string: String)
    
    func requestCoffee(_ type: CoffeeType)
}
