//
//  MainViewModel.swift
//  Mission02
//
//  Created by dohan on 28/08/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import UIKit
import Combine
import Foundation


public struct Ordered {
    public var ID: Int
    public var orderedDrink:String
    var orderStatus: Status
    init(_ ID: Int, _ orderedDrink:String, _ status:Status) {
        self.ID = ID
        self.orderedDrink = orderedDrink
        self.orderStatus = Status(rawValue: status.rawValue)!
    }
}
class OrderList: ObservableObject{
    @Published var orderedList = [Ordered]()
}

 


public var customerNumber = 0



enum Status:String{
    case Paid = "Paid"
    case Making = "Making"
    case Done = "Done"
}

class Customer: NSObject, ObservableObject {
    
    var orderedCoffee = ""
    var Id:Int
    var status: Status
    
    init(ordered: Int, customer: Int) {
        
        customerNumber += 1
        self.Id = customerNumber
//        self.orderedCoffee = menuList[ordered][1] as! String
        self.orderedCoffee = "dkap"
        self.status = .Paid
        
        let newOrder = Ordered(self.Id, self.orderedCoffee,  self.status)
       // orderedList.append(newOrder)
        
    }
    
    

}
class Cashier: Observer {
    private var subject: Subject = Subject()
    init(_ subject: Subject){
        self.subject = subject
        self.subject.attachObserver(self)
    }
    func update() {
        
    }
    
    @Published var income:Int = 0
    
}
class Barista: NSObject, ObservableObject{
    
}

