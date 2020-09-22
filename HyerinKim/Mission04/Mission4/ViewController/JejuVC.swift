//
//  JejuVC.swift
//  Mission4
//
//  Created by dohan on 22/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation

class JejuVC: UIViewController {
    enum JejuMenu {
        case none, cheese, chicken, shrimp, hanriver
    }
    let selectedMenu = BehaviorRelay(value: SeoulMenu.none)
    var disposebag = DisposeBag()
    
    @IBOutlet weak var cheesePizza: UIButton!
    @IBOutlet weak var shrimpPizza: UIButton!
    @IBOutlet weak var tangerinePizza: UIButton!
    @IBOutlet weak var orderBtn: UIButton!
    
    @IBAction func orderPizza(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
        setLayout()
    }
    
    func binding(){
        cheesePizza.rx.tap.map{SeoulMenu.cheese}
            .bind(to:selectedMenu).disposed(by: disposebag)
        shrimpPizza.rx.tap.map{SeoulMenu.shrimp}
            .bind(to:selectedMenu).disposed(by: disposebag)
        tangerinePizza.rx.tap.map{SeoulMenu.hanriver}
            .bind(to:selectedMenu).disposed(by: disposebag)
        
        selectedMenu.map{$0 == .cheese}
            .bind(to: cheesePizza.rx.isSelected).disposed(by: disposebag)
        selectedMenu.map{$0 == .shrimp}
            .bind(to: shrimpPizza.rx.isSelected).disposed(by: disposebag)
        selectedMenu.map{$0 == .hanriver}
            .bind(to: tangerinePizza.rx.isSelected).disposed(by: disposebag)
        
        selectedMenu.map{$0 != .none}.bind(to: orderBtn.rx.isEnabled)
            .disposed(by: disposebag)
    }
    
    func setLayout(){
        orderBtn.backgroundColor = UIColor.black
        orderBtn.tintColor = UIColor.white
        orderBtn.layer.cornerRadius = 15
        
        
        
    }

}
