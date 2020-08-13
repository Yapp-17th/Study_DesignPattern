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
    
    private var contentView: UIView = UIView()
    private var requestOrderButton: UIButton = UIButton()
    
    private var debugLogLabel: UILabel = UILabel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        view.backgroundColor = .talkWhite000s
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = .talkWhite000s
        
        setNavigationBarContent(title: "커피 전문점")
        setViewLayout()
        updateViewStyle()
    }
    
    public func setNavigationBarContent(title: String) {
        self.navigationItem.title = title
    }
    
    private func updateViewStyle() {
        requestOrderButton.backgroundColor = .talkBlue500s
        requestOrderButton.layer.cornerRadius = 4
        requestOrderButton.layer.masksToBounds = true
    }
    
    private func setViewLayout() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(requestOrderButton)
        requestOrderButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
            make.height.equalTo(38)
        }
        
        requestOrderButton.setTitle("주문하기", for: .normal)
        requestOrderButton.setTitleColor(.white, for: .normal)
        requestOrderButton.titleLabel?.font = .font14P
        requestOrderButton.addTarget(self, action: #selector(onClickReqOrderButton(_:)), for: .touchUpInside)
    }
    
    @objc
    private func onClickReqOrderButton(_ sender: UIButton) {
        let randomCoffeeType = Int.random(in: 0..<3)
        let requestCoffeeType = CoffeeType(rawValue: randomCoffeeType) ?? .americano
        presenter.requestCoffeeOrder(coffeeType: requestCoffeeType)
        
    }
    
    public func updateDebugLog(content: String) {
        // MARK: Update Debug Log
        print(content)
    }
}
