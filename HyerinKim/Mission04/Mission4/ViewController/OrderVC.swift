//
//  OrderVC.swift
//  Mission4
//
//  Created by dohan on 24/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import UIKit

class OrderVC: UIViewController {
    
    @IBOutlet weak var store: UILabel!
    @IBOutlet weak var process: UITextView!
    
    
    
    var orderedPizza:Pizza?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let pizza = orderedPizza else { return }
        makingPizza(pizza: pizza)
        
    }
    
    func makingPizza(pizza: Pizza){
        
        process.text.append(pizza.name + "주문\n\n")
        process.text.append("\(pizza.dough) 도우 준비 완료\n\n")
        process.text.append("토핑 : \n")
        for t in pizza.toppings {
            process.text.append(t + "\n")
        }
        process.text.append("\n\(pizza.temp)에서 \(pizza.time)분간 구워줌\n\n")
        process.text.append("완성!")
        
        
        
        
        
        
        
    }
    
    
}
