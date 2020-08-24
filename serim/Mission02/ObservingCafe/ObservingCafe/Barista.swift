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
    }
    
    init(id: String) {
        self.id = id
        NotificationCenter.default.addObserver(self, selector: #selector(popOrder), name: .checkOrders, object: nil)
    }
    
    // 바리스타가 order 리스트 건드리는 게 맘에 안 듦.. 
    @objc func popOrder() {
        if(isWorking) { return }
        if(Cashier.shared.orders.isEmpty) { return }
        let order = Cashier.shared.orders.removeFirst()
        make(coffee: order.coffee, for: order.customer)
    }
    
    func make(coffee: Coffee, for customer: Customer) {
        isWorking = true
        print("Barista #\(self.id) -> \(coffee.type) 제조 시작!")
        sleep(coffee.makingTime)
        print("Barista #\(self.id) -> \(coffee.type) 제조 완료!")
        isWorking = false
        notifyFinished(coffee, for: customer)
    }
}
