//
//  Pizza.swift
//  Mission04-Denny
//
//  Created by user on 2020/09/30.
//

import Foundation

public class PizzaModel {
    var pizzaName: String?
    var dough: String?
    var sauce: String?
    var toppings: [String] = [String]()
    
    func prepare() {
        print("Preparing... Pizza : \(pizzaName ?? "")")
        print("Tossing Dough...")
        print("Adding Sauce... Sauce : \(sauce ?? "")")
        print("Adding Toppings...")
        
        toppings.forEach { topping in
            print("> Topping : \(topping)")
            DebugWorker.shared.appendDebugLog(string: "> Topping : \(topping)")
        }
    }
    
    func bake() {
        print("Bake for 25 minutes at 350...")
        DebugWorker.shared.appendDebugLog(string: "Bake for 25 minutes at 350...")
    }
    
    func cut() {
        print("Cutting the pizza into diagonal slices...")
        DebugWorker.shared.appendDebugLog(string: "Cutting the pizza into diagonal slices...")
    }
    
    func box() {
        print("Place pizza in official PizzaStore box...")
        DebugWorker.shared.appendDebugLog(string: "Place pizza in official PizzaStore box...")
    }
}

public class CheezePizza: PizzaModel {
    public override init() {
        super.init()
        super.pizzaName = "Cheeze Pizza"
        super.dough = "Thin Crust Dough"
        super.sauce = "Tomato Sauce"
        super.toppings.append("Grated Reggiano Cheese")
    }
    
    public override func cut() {
        print("Cutting the pizza into square slices...")
        DebugWorker.shared.appendDebugLog(string: "Cutting the pizza into square slices...")
    }
}

public class PeperoniPizza: PizzaModel {
    public override init() {
        super.init()
        super.pizzaName = "Peperoni Pizza"
        super.dough = "Thin Crust Dough"
        super.sauce = "Tomato Sauce"
        super.toppings.append("Peperoni Saussage")
    }
    
    public override func cut() {
        print("Cutting the pizza into square slices...")
        DebugWorker.shared.appendDebugLog(string: "Cutting the pizza into square slices...")
    }
}

public class BulgogiPizza: PizzaModel {
    public override init() {
        super.init()
        super.pizzaName = "Bulgogi Pizza"
        super.dough = "Thin Crust Dough"
        super.sauce = "Bulgogi Sauce"
        super.toppings.append("Bulgogi Meats")
    }
}
