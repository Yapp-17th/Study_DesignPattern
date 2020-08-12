//
//  MainPresenter.swift
//  Mission01-Denny
//
//  Created by Denny on 2020/08/12.
//  Copyright © 2020 Denny. All rights reserved.
//

import Foundation

public class MainPresenter: MainPresenterProtocol {
    private var view: MainViewProtocol?
    
    public static var sharedInstance: MainPresenter = MainPresenter()
    
    private init() { }
    
    public func attachView(view: MainViewProtocol) {
        self.view = view
    }
}
