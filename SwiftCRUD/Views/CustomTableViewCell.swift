//
//  CustomTableViewCell.swift
//  SwiftCRUD
//
//  Created by Владислав on 05.01.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var parcelIdLabel: UILabel!
    @IBOutlet weak var recipientIdLabel: UILabel!
    @IBOutlet weak var statusTitleLabel: UILabel!
    @IBOutlet weak var parcelWeightLabel: UILabel!
    @IBOutlet weak var parcelCostLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
