//
//  DebugCell.swift
//  Mission01-Denny
//
//  Created by Denny on 2020/08/14.
//  Copyright © 2020 Denny. All rights reserved.
//

import UIKit
import SnapKit

public class DebugCell: UITableViewCell {
    public static let identifier: String = "debugCell"
    private var contentLabel: UILabel = UILabel()
    public var content: String? {
        didSet {
            contentLabel.text = content
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        contentLabel.textColor = .talkGray900s
        contentLabel.font = .font14P
        contentLabel.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
