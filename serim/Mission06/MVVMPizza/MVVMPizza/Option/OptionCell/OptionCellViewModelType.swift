//
//  OptionCellViewModelType.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/19.
//

import Foundation

protocol OptionCellViewModelType: class {
    var item: OptionToppingType { get set }
}

class OptionCellViewModel: OptionCellViewModelType {
    
    var item: OptionToppingType
    
    init(item: OptionToppingType) {
        self.item = item 
    }
    
}
