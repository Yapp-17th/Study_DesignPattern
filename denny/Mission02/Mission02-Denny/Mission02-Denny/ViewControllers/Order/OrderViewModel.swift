//
//  OrderViewModel.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/17.
//

import Foundation
import Combine
import CoffeeCommon

public class OrderViewModel: NSObject, ObservableObject {
    @Published var coffeeItem: CoffeeOptionItem = CoffeeOptionItem(title: nil, options: [Coffee]())
    
    func generateCoffeeMenu() {
        coffeeItem = CoffeeOptionItem(title: "메뉴 선택",
                                      options: [Coffee(coffeeName: "아메리카노", type: .espresso),
                                                Coffee(coffeeName: "에스프레소", type: .espresso),
                                                Coffee(coffeeName: "카푸치노", type: .espresso)])
    }
}
