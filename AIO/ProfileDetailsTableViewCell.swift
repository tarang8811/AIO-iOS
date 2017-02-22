//
//  ProfileDetailsTableViewCell.swift
//  AIO
//
//  Created by Tarang on 22/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit

class ProfileDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileTag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
   
}
