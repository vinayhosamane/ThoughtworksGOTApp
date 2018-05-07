//
//  GOTDetailsTableCell.swift
//  GOTFareApp
//
//  Created by K N Hosamane, Vinay on 5/7/18.
//  Copyright © 2018 Hosamane K N, Vinay. All rights reserved.
//

import UIKit

class GOTDetailsTableCell: UITableViewCell {

    @IBOutlet  var profileTypeLabel: UILabel?
    
    @IBOutlet  var profileTypeScoreLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
