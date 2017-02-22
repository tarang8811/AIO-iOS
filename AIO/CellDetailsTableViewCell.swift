//
//  CellDetailsTableViewCell.swift
//  AIO
//
//  Created by Tarang on 22/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit

class CellDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbNail: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var bottomGrayView: UIView!
    @IBOutlet weak var topGrayView: UIView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
