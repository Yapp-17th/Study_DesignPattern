//
//  CustomCell.swift
//  CoffeeShop
//
//  Created by 바보세림이 on 2020/08/14.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell { 
    
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
