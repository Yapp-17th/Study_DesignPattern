//
//  MenuViewController+UI.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/19.
//

import Foundation

extension MenuViewController {
    
    func setUpViews() {
        self.view.backgroundColor = .white
        [titleLabel, descriptionLabel, orderTableView, nextButton].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setUpLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(60)
            $0.width.equalToSuperview()
            $0.height.equalTo(50)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalTo(40)
        }
        orderTableView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(nextButton.snp.top).offset(-30)
        }
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-110)
            $0.width.equalTo(150)
            $0.height.equalTo(50)
        }
    }
    
}
