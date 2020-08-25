//
//  Cashier.swift
//  ObservingCafe
//
//  Created by 바보세림이 on 2020/08/24.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

protocol Observer {
    func getCoffee(_ coffee: Coffee, for customer: Customer)
}

struct Order {
    let id: Int
    let customer: Customer
    let coffee: Coffee
    
    init(_ id: Int, coffee: Coffee, by customer: Customer) {
        self.id = id
        self.coffee = coffee
        self.customer = customer
    }
}

class Cashier: Observer {
    static let shared = Cashier()
    
    var orders: [Order] = []
    var orderCount = 0

    func getCoffee(_ coffee: Coffee, for customer: Customer) {
        serve(coffee: coffee, to: customer)
    }
    
    func appendOrder(_ customer: Customer, _ coffee: Coffee) {
        let order = Order(orderCount, coffee: coffee, by: customer)
        orders.append(order)
        orderCount += 1
        print("🗣 \(customer.id) 님의 \(coffee.type) 주문 받았습니다~")
        NotificationCenter.default.post(name: .checkOrders, object: nil)
    }
    
    private func serve(coffee: Coffee, to customer: Customer) {
        print("🗣 \(customer.id) 님이 주문하신 \(coffee.type) 나왔습니다~")
    }
}

extension Notification.Name {
    static let checkOrders = Notification.Name("checkOrders")
}
