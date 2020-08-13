//
//  MainModel.swift
//  Mission01-Denny
//
//  Created by Denny on 2020/08/14.
//  Copyright © 2020 Denny. All rights reserved.
//

import Foundation

public class MainModel: MainModelProtocol, CasherDelegate {
    private var casher: Casher = Casher.shared
    private weak var presenter: MainPresenter? = MainPresenter.sharedInstance
    
    public init() {
        casher.delegate = self
    }
    
    public func appendNewLog(string: String) {
        presenter?.appendDebugLog(content: string)
    }
    
    public func serveCoffee(_ order: Order) {
        let content = "[Casher] 손님에게 커피를 제공합니다.... 커피 타입 : \(order.coffeeType ?? .americano)\n----------"
        appendNewLog(string: content)
    }
    
    public func getMakeStatus(_ content: String) {
        presenter?.appendDebugLog(content: content)
    }
    
    public func requestCoffee(_ type: CoffeeType) {
        let content = "[Casher] 커피메이커에게 주문을 전달합니다...."
        appendNewLog(string: content)
        casher.requestOrder(coffeeType: type)
    }
}
