//
//  MainContract.swift
//  Mission01-Denny
//
//  Created by Denny on 2020/08/12.
//  Copyright © 2020 Denny. All rights reserved.
//

import Foundation

public protocol MainPresenterProtocol {
    func attachView(view: MainViewProtocol)
}

public protocol MainViewProtocol {
    func setNavigationBarContent(title: String)
    
    func updateOrderView(orderList: [Order])
}
