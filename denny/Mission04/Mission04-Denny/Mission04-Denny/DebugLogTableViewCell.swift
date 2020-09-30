//
//  DebugLogTableViewCell.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/22.
//

import SnapKit
import UIKit

public class DebugLogTableViewCell: UITableViewCell {
    public static let identifier: String = "debugLogCell"
    public var content: String? {
        didSet {
            if contentLabel != nil {
                contentLabel.text = content
            }
        }
    }
    
    @IBOutlet weak var contentLabel: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        initViewLayout()
    }
    
    private func initViewLayout() {
        contentLabel.font = .font15P
        contentLabel.numberOfLines = 0
        contentLabel.textColor = .missionGray900s
        contentLabel.text = content
    }
    
}

