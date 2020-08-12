//
//  ViewController.swift
//  Mission01-Denny
//
//  Created by Denny on 2020/08/11.
//  Copyright © 2020 Denny. All rights reserved.
//

import UIKit
import SnapKit

public class MainViewController: UIViewController, MainViewProtocol {
    private var presenter: MainPresenter = MainPresenter.sharedInstance
    private var navigationBar: UINavigationBar?
    private var navigationTitleLabel: UILabel = UILabel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        view.backgroundColor = .talkWhite000s
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = .talkWhite000s
        self.setNavigationBarContent(title: "커피 전문점")
    }
    
    public func setNavigationBarContent(title: String) {
        self.navigationItem.title = title
    }
    
    public func updateOrderView(orderList: [Order]) {
        
    }
}

