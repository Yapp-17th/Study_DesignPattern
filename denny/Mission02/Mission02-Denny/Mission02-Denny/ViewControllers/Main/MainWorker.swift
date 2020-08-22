//
//  MainModel.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/15.
//

import Foundation
import CoffeeCommon

public class MainWorker {
    public static var shared: MainWorker = MainWorker()
    public var customerList: [Customer] = [Customer]()
    
    private init() { }
    
    public func addCustomer(customerId: Int64) {
        self.customerList.append(Customer(customerId: customerId))
    }
    
    public func doProcessOrder(order: Order) {
        if let customer = self.customerList.filter({ $0.customerId == order.customerId }).first {
            customer.requestCoffeeOrder(order: order)
        } else {
            let newCustomer = Customer(customerId: order.customerId)
            self.customerList.append(Customer(customerId: order.customerId))
            newCustomer.requestCoffeeOrder(order: order)
        }
    }
}

extension MainWorker: CustomerDelegate {
    public func receiveCoffeeOrder(_ customerId: Int64, _ coffee: Coffee) {
        let content = "[Casher] 손님(id:\(customerId)이 커피를 받았습니다.\n커피 : \(coffee.coffeeName)"
        DebugLog(content)
        DebugWorker.shared.appendDebugLog(string: content)
    }
}
