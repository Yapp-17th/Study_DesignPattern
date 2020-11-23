//
//  CartViewController+UI.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/19.
//

import Foundation

extension CartViewController {
    
    func setUpViews() {
        self.view.backgroundColor = .white 
        [titleLabel, orderTableView, orderButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    func setUpLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(60)
            $0.width.equalToSuperview()
            $0.height.equalTo(50)
        }
        orderTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(orderButton.snp.top).offset(-30)
        }
        orderButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-110)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }
    }
    
}
