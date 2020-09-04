//
//  CoffeeViewController.swift
//  CoffeeShop
//
//  Created by 바보세림이 on 2020/08/14.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit

class CoffeeViewController: UIViewController {

    @IBOutlet weak var coffeeLabel: UILabel!
    
    var madeCoffee: Coffee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coffeeLabel.text = madeCoffee?.type ?? "🍺"
    }

}
