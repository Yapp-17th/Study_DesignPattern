//
//  MenuCell.swift
//  Subway
//
//  Created by 바보세림이 on 2020/10/22.
//

import UIKit
import SnapKit
import Then

class MenuCell: UITableViewCell {
    lazy var menuImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .gray
    }
    lazy var titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.text = "Title"
        $0.textAlignment = .left
    }
    lazy var descriptionLabel = UILabel().then {
        $0.text = "Description"
        $0.textColor = .gray
        $0.textAlignment = .left
    }
    lazy var priceLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.text = "1000원"
        $0.textColor = #colorLiteral(red: 0.2794902628, green: 0.7647058964, blue: 0.2362534876, alpha: 1)
        $0.textAlignment = .right
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "menuCell")
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViews()
    }
    
    func configureViews() {
        [menuImageView, titleLabel, descriptionLabel, priceLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        menuImageView.snp.makeConstraints {
            $0.top.equalTo(10)
            $0.leading.equalTo(20)
            $0.bottom.equalTo(-10)
            $0.height.equalTo(menuImageView.snp.width)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(10)
            $0.leading.equalTo(menuImageView.snp.trailing).offset(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(30)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(20)
        }
        priceLabel.snp.makeConstraints {
            $0.bottom.equalTo(-20)
            $0.leading.trailing.equalTo(descriptionLabel)
            $0.height.equalTo(20)
        }
    }
    
}
