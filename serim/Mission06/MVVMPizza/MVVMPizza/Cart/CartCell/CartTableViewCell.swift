//
//  CartTableViewCell.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/20.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    static let ID = "cartCell"
    
    var viewModel: CartCellVieWModelType?
    
    lazy var mainLabel = UILabel()
    lazy var optionLabel = UILabel()
    lazy var priceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewModel: CartCellVieWModelType) {
        self.viewModel = viewModel
        mainLabel.text = viewModel.item.main.getName()
        optionLabel.text = viewModel.option
        priceLabel.text = viewModel.priceString
    }
}

extension CartTableViewCell {
    
    func setUpViews() {
        [mainLabel, optionLabel, priceLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    func setUpLayout() {
        mainLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.leading.equalTo(30)
        }
        optionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(mainLabel.snp.bottom).offset(8)
            make.leading.equalTo(mainLabel)
        }
        priceLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(-30)
            make.bottom.equalTo(-20)
        }
    }
    
}
