//
//  MenuCellViewModel.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/19.
//

import Foundation

protocol MenuCellViewModelType: class {
    var main: MainToppingType { get set }
}

class MenuCellViewModel: MenuCellViewModelType {

    var main: MainToppingType
    
    init(main: MainToppingType) {
        self.main = main
    }
    
}
