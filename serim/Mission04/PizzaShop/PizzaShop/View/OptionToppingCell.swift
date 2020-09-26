//
//  OptionToppingCell.swift
//  PizzaShop
//
//  Created by 바보세림이 on 2020/09/26.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit

class OptionToppingCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "optionToppingCell")
        self.layer.cornerRadius = 10
        self.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
