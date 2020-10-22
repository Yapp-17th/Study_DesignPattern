//
//  MenuViewController+UI.swift
//  Subway
//
//  Created by 바보세림이 on 2020/10/22.
//

import UIKit

extension MenuViewController {
    func configureViews() {
        [titleImageView, descriptionLabel, menuTableView].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        titleImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
            $0.height.equalTo(60)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleImageView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
        menuTableView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-40)
        }
    }
}
