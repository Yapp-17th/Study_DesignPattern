//
//  LogTableCell.swift
//  Mission03
//
//  Created by dohan on 09/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import UIKit

class LogTableCell: UITableViewCell {

    @IBOutlet weak var log: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
