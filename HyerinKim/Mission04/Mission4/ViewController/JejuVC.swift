//
//  JejuVC.swift
//  Mission4
//
//  Created by dohan on 22/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class JejuVC: UIViewController {
   
    let jejuFactory = JejuPizzaFactory()
    let selectedMenu = BehaviorRelay(value: "none")
    var disposebag = DisposeBag()
    
    @IBOutlet weak var cheesePizza: UIButton!
    @IBOutlet weak var shrimpPizza: UIButton!
    @IBOutlet weak var tangerinePizza: UIButton!
    @IBOutlet weak var orderBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
        setLayout()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(selectedMenu.value)
        let pizza = jejuFactory.orderPizza(for: selectedMenu.value)
        guard let orderView = segue.destination as? OrderVC else {return}
        orderView.orderedPizza = pizza
    }
    
    func binding(){
        cheesePizza.rx.tap.map{"cheese"}
            .bind(to:selectedMenu).disposed(by: disposebag)
        shrimpPizza.rx.tap.map{"shrimp"}
            .bind(to:selectedMenu).disposed(by: disposebag)
        tangerinePizza.rx.tap.map{"tangerine"}
            .bind(to:selectedMenu).disposed(by: disposebag)
        
        selectedMenu.map{$0 == "cheese"}
            .bind(to: cheesePizza.rx.isSelected).disposed(by: disposebag)
        selectedMenu.map{$0 == "shrimp"}
            .bind(to: shrimpPizza.rx.isSelected).disposed(by: disposebag)
        selectedMenu.map{$0 == "tangerine"}
            .bind(to: tangerinePizza.rx.isSelected).disposed(by: disposebag)
        
        selectedMenu.map{$0 != "none"}.bind(to: orderBtn.rx.isEnabled)
            .disposed(by: disposebag)
    }
    
    func setLayout(){
        orderBtn.backgroundColor = UIColor.black
        orderBtn.tintColor = UIColor.white
        orderBtn.layer.cornerRadius = 15
        
        
        
    }

}
