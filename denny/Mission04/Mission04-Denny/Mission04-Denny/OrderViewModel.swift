//
//  OrderViewModel.swift
//  Mission04-Denny
//
//  Created by Denny on 2020/09/14.
//

import Foundation
import Combine

public struct Pizza {
    public var pizzaName: String
    public var type: PizzaType
    public var selected: Bool = false
}

public struct PizzaOptionItem {
    public var title: String?
    public var options: [Pizza]
}

public class OrderViewModel: NSObject, ObservableObject {
    @Published var pizzaItem: PizzaOptionItem = PizzaOptionItem(title: nil, options: [Pizza]())
    
    func generatePizzaMenu() {
        pizzaItem = PizzaOptionItem(title: "메뉴 선택",
                                      options: [Pizza(coffeeName: "Pizza1", type: .meat),
                                                Pizza(coffeeName: "Pizza2", type: .pepparoni)])
    }
}
