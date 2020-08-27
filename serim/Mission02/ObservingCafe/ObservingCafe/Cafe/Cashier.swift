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

protocol ServeDelegate {
    func updateServeLabel(_ string: String)
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
    
    var serveDelegate: ServeDelegate?
    var orders: [Order] = []
    var orderCount = 0
    var serveText: String = "메뉴 선택 후 주문해주세요 ~" {
        didSet {
            serveDelegate?.updateServeLabel(serveText)
        }
    }

    func getCoffee(_ coffee: Coffee, for customer: Customer) {
        serve(coffee: coffee, to: customer)
    }
    
    func appendOrder(_ customer: Customer, _ coffee: Coffee) {
        let order = Order(orderCount, coffee: coffee, by: customer)
        orders.append(order)
        orderCount += 1
        serveText = "🎤 \(customer.id)번째 손님의 \(coffee.type) 주문 받았습니다~"
        NotificationCenter.default.post(name: .checkOrders, object: nil)
    }
    
    private func serve(coffee: Coffee, to customer: Customer) {
        serveText = "🥤 \(customer.id)번째 손님이 주문하신 \(coffee.type) 나왔습니다~"
    }
}

extension Notification.Name {
    static let checkOrders = Notification.Name("checkOrders")
}
