//
//  MenuTableViewCell.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/19.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    static let ID = "menuCell"

    lazy var menuImageView = UIImageView()
    lazy var menuLabel = UILabel()
    lazy var priceLabel = UILabel().then {
        $0.textColor = .gray
        $0.textAlignment = .right
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "menuCell")
        setUpViews()
        setUpLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(viewModel: MenuCellViewModelType) {
        menuLabel.text = viewModel.main.getName()
        priceLabel.text = "\(viewModel.main.getPrice())"
    }
    
}

extension MenuTableViewCell {
    
    func setUpViews() {
        [menuImageView, menuLabel, priceLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setUpLayout() {
        menuImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(70)
            $0.leading.equalToSuperview().offset(30)
        }
        menuLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(menuImageView.snp.trailing).offset(20)
            $0.width.equalTo(120)
            $0.height.equalTo(30)
        }
        priceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(menuLabel.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(30)
        }
    }
    
}
