//
//  LeftMenuTableViewSection.swift
//  AIO
//
//  Created by Mohit Saini on 26/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit

class LeftMenuTableViewSection: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var iconButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        iconButton.layer.cornerRadius = 10
        iconButton.backgroundColor = UIColor.clear
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
