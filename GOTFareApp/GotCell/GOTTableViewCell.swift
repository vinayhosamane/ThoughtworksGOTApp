//
//  GOTTableViewCell.swift
//  GOTFareApp
//
//  Created by K N Hosamane, Vinay on 5/6/18.
//  Copyright © 2018 Hosamane K N, Vinay. All rights reserved.
//

import UIKit

class GOTTableViewCell: UITableViewCell {
    
    @IBOutlet var kingBanerImage: UIImageView!
    @IBOutlet var kingNameLabel: UILabel!
    @IBOutlet var kingEloRatingLabel: UILabel!
    @IBOutlet var kingTotalAttacksLabel: UILabel!
    @IBOutlet var kingTotalDefenceLabel: UILabel!
    @IBOutlet var kingTotalWinsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        kingBanerImage = UIImageView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
