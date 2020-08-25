//
//  Barista.swift
//  ObservingCafe
//
//  Created by 바보세림이 on 2020/08/24.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

protocol Subject {
    var observers: [Observer] { get set }
    func addObserver(_ observer: Observer)
    func notifyFinished(_ coffee: Coffee, for customer: Customer)
}

class Barista: Subject {
    let id: String
    var isWorking = false
    var observers: [Observer] = []
    
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    func notifyFinished(_ coffee: Coffee, for customer: Customer) {
        self.observers.forEach { $0.getCoffee(coffee, for: customer) }
        checkOrder()
    }
    
    init(id: String) {
        self.id = id
        NotificationCenter.default.addObserver(self, selector: #selector(checkOrder), name: .checkOrders, object: nil)
    }

    @objc func checkOrder() {
        DispatchQueue.global().sync {
            if(self.isWorking) { return }
            print(Cashier.shared.orders.count)
            if(Cashier.shared.orders.isEmpty) { return }
            let order = Cashier.shared.orders.removeFirst()
            self.make(coffee: order.coffee, for: order.customer)
        }
    }
    
    private func make(coffee: Coffee, for customer: Customer) {
        DispatchQueue.global().async {
            self.isWorking = true
            print("Barista #\(self.id) -> \(coffee.type) 제조 시작!")
            sleep(coffee.makingTime)
            print("Barista #\(self.id) -> \(coffee.type) 제조 완료!")
            self.isWorking = false
            self.notifyFinished(coffee, for: customer)
        }
    }
}
