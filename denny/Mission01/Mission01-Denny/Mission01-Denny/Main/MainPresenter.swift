//
//  MainPresenter.swift
//  Mission01-Denny
//
//  Created by Denny on 2020/08/12.
//  Copyright © 2020 Denny. All rights reserved.
//

import Foundation

public class MainPresenter: MainPresenterProtocol {
    private var view: MainViewProtocol?
    private var model: MainModel?
    
    public static var sharedInstance: MainPresenter = MainPresenter()
    
    private init() { }
    
    public func attachView(view: MainViewProtocol) {
        self.view = view
        self.model = MainModel()
    }
    
    public func appendDebugLog(content: String) {
        view?.updateDebugLog(content: content)
    }
    
    public func requestCoffeeOrder(coffeeType: CoffeeType) {
        let randomCoffeeType = Int.random(in: 0..<3)
        let requestCoffeeType = CoffeeType(rawValue: randomCoffeeType) ?? .americano
        let content = "[손님] 커피를 주문합니다... 커피타입 : \(requestCoffeeType)"
        
        DebugWorker.shared.appendDebugLog(string: "[커피 주문 로그]")
        DebugWorker.shared.appendDebugLog(string: content)
        appendDebugLog(content: content)
        model?.requestCoffee(requestCoffeeType)
    }
}
