//
//  File.swift
//  GOTFareApp
//
//  Created by K N Hosamane, Vinay on 5/5/18.
//  Copyright © 2018 Hosamane K N, Vinay. All rights reserved.
//

import Foundation
import UIKit

class King: NSObject {
    
    var kingName: String?
    //    var totalDefence: Int?
    //    var totalAttacks:Int?
    var bannerImage: UIImage?
    //
    //    var totalWins: Int = 0
    //    var totalLoss: Int = 0
    var eloRating: Int = 400
    
    init?(kingName:String?,bannerImage:UIImage?) {
        
        super.init()
        
        self.kingName = kingName
        self.bannerImage = bannerImage
    }
    
    func updateElorating(newElorating elo:Int){
        self.eloRating = elo
    }
    
}
