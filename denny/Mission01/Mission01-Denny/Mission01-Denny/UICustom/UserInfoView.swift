//
//  UserInfoView.swift
//  Mission01-Denny
//
//  Created by Denny on 2020/08/12.
//  Copyright © 2020 Denny. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class UserInfoView: UIView {
    private var profileImageView: UIImageView = UIImageView()
    private var userTypeLabel: UILabel = UILabel()
    private var userStatusLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
