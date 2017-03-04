//
//  LeftMenuTableViewCell.swift
//  AIO
//
//  Created by Mohit Saini on 25/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit

class LeftMenuTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        iconImageView.layer.cornerRadius = 10
        iconImageView.backgroundColor = Layout.UIColorFromHex(colorCode: "D0C6D0")
        iconButton.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
