//
//  PizzaStore.swift
//  Mission04-Denny
//
//  Created by Denny on 2020/09/14.
//

import Foundation

public class PizzaStore {
    public static let shared: PizzaStore = PizzaStore()
    
    private init() { }
    
    public func orderPizza(menu: String) -> PizzaModel {
        var pizza: PizzaModel
        pizza = createPizza(menu: menu)
        
        pizza.prepare()
        pizza.bake()
        pizza.cut()
        pizza.box()
        
        return pizza
    }
    
    public func createPizza(menu: String) -> PizzaModel {
        if menu == "cheese" {
            return CheezePizza()
        } else if menu == "bulgogi" {
            return BulgogiPizza()
        } else if menu == "peperoni" {
            return PeperoniPizza()
        } else {
            // Default Pizza
            return CheezePizza()
        }
    }
}
