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
        
        initializeNavigationBarLayout()
        setNavigationBarContent(title: "커피 전문점")
    }
    
    private func initializeNavigationBarLayout() {
        let width = self.view.frame.width
        navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        
        view.addSubview(navigationBar!)
        navigationBar?.addSubview(navigationTitleLabel)
        
        navigationBar?.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
        }
        
        navigationTitleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    public func setNavigationBarContent(title: String) {
        navigationBar?.barTintColor = .talkWhite000s
        navigationTitleLabel.text = title
        navigationTitleLabel.font = .font17PBold
    }
    
    public func updateOrderView(orderList: [Order]) {
        
    }
}

