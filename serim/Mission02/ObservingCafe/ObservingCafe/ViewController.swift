//
//  ViewController.swift
//  ObservingCafe
//
//  Created by 바보세림이 on 2020/08/24.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit

struct Order {
    let customer: Customer
    let coffee: Coffee
    
    init(coffee: Coffee, by customer: Customer) {
        self.coffee = coffee
        self.customer = customer
    }
}

class ViewController: UIViewController {
    var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

