//
//  Cashier.swift
//  ObservingCafe
//
//  Created by 바보세림이 on 2020/08/24.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

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

class Cashier {
    static let shared = Cashier()
    
    var orders: [Order] = []
    var orderCount = 0
    
    func appendOrder(_ customer: Customer, _ coffee: Coffee) {
        let order = Order(orderCount, coffee: coffee, by: customer)
        orders.append(order)
        orderCount += 1
    }

    func removeOrder(_ order: Order) {
        orders = orders.filter { $0.id != order.id }
        serve(coffee: order.coffee, to: order.customer)
    }
    
    private func serve(coffee: Coffee, to customer: Customer) {
        print("🗣 \(customer.id) 님이 주문하신 \(coffee) 나왔습니다 ~")
    }
}
