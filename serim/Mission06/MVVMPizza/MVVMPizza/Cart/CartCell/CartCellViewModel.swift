//
//  CartCellViewModel.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/20.
//

import Foundation

protocol CartCellVieWModelType: class {
    var item: Pizza { get set }
    var option: String { get }
    var priceString: String { get set }
}

class CartCellViewModel: CartCellVieWModelType {
    
    var item: Pizza
    var option: String {
        guard let result = item.option?.reduce("", { (first: String, second) -> String in
            return first + second.getName() + " "}) else { return "" }
        return result
    }
    var price: Int {
        var price = item.main.getPrice()
        guard let option = item.option else { return price }
        price = option.reduce(price, { (first: Int, second) -> Int in
            return first + second.getPrice()
        })
        return price
    }
    lazy var priceString = "\(price)원"
    
    init(item: Pizza) {
        self.item = item
    }
    
}
