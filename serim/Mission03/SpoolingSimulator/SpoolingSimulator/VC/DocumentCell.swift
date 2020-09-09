//
//  DocumentCell.swift
//  SpoolingSimulator
//
//  Created by 바보세림이 on 2020/09/09.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit
import SnapKit

class DocumentCell: UITableViewCell {

    var document: Document?
    let titleLabel = UILabel()
    var printButton: UIButton = {
        let button = UIButton()
        button.setTitle("Print", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(red: 202/256, green: 198/256, blue: 255/256, alpha: 1)
        // button.addTarget(self, action: #selector(printDocument), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "documentCell")
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: AutoLayout

extension DocumentCell {
    private func configureViews() {
        self.addSubview(titleLabel)
        self.addSubview(printButton)
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(40)
            $0.width.equalTo(220)
            $0.height.equalTo(30)
        }
        
        printButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(-40)
            $0.width.equalTo(70)
            $0.height.equalTo(titleLabel)
        }
    }
}
