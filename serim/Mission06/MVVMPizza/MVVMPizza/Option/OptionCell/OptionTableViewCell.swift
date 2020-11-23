//
//  OptionTableViewCell.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/19.
//

import UIKit

class OptionTableViewCell: UITableViewCell {
    
    static let ID = "optionCell"

    lazy var menuLabel = UILabel()
    lazy var priceLabel = UILabel().then {
        $0.textColor = .gray
        $0.textAlignment = .right
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "optionCell")
        setUpViews()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(viewModel: OptionCellViewModelType) {
        menuLabel.text = viewModel.item.getName()
        priceLabel.text = "+\(viewModel.item.getPrice())원"
    }
}

extension OptionTableViewCell {
    
    func setUpViews() {
        [menuLabel, priceLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setUpLayout() {
        menuLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
            $0.width.equalTo(120)
            $0.height.equalTo(30)
        }
        priceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-30)
            $0.width.equalTo(120)
            $0.height.equalTo(30)
        }
    }
    
}
