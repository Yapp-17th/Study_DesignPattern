//
//  Observer.swift
//  Mission02
//
//  Created by dohan on 28/08/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation

protocol Observer {
    func update()
}
class Subject{
    private var observers: [Observer] = [Observer]()
    private var sum: Int = Int()
    var number: Int{
        set{
            sum = number
            
        }
        get{
            return sum
        }
    }
    
    func attachObserver(_ observer: Observer){
        observers.append(observer)
    }
}
