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
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(40)
            $0.width.equalTo(220)
            $0.height.equalTo(30)
        }
    }
}
