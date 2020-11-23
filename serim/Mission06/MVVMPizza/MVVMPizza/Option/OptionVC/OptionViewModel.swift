//
//  OptionViewModel.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/19.
//

import Foundation

protocol OptionViewModelType: class {
    var option: [OptionToppingType] { get set }
    var totalPrice: Int { get set }
    func add(item: OptionToppingType)
    func remove(item: OptionToppingType)
    func orderPizza()
}

class OptionViewModel: OptionViewModelType {
    
    var main: MainToppingType
    var option = [OptionToppingType]()
    var totalPrice: Int
    
    init(main: MainToppingType) {
        self.main = main
        self.totalPrice = main.getPrice()
    }
    
    func add(item: OptionToppingType) {
        option.append(item)
        totalPrice += item.getPrice()
    }
    
    func remove(item: OptionToppingType) {
        option = option.filter { $0.getName() != item.getName() }
        totalPrice -= item.getPrice()
    }
    
    func orderPizza() {
        let pizza = Pizza(main: main, option: option)
        CartItem.shared.append(item: pizza)
    }
    
}
