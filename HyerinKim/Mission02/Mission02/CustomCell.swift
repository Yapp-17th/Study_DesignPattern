//
//  TableCellTableViewCell.swift
//  Mission02
//
//  Created by dohan on 28/08/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var drink: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
