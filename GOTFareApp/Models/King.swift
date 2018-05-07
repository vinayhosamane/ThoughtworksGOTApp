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
    private var _eloRating:Double //= 400.0
    var eloRating: Double {
        set{
            _eloRating=newValue
        }
        get{
            return _eloRating
        }
    }
    
    init?(kingName:String?,bannerImage:UIImage?) {
        _eloRating = 400.0
        super.init()
        
        self.kingName = kingName
        self.bannerImage = bannerImage
    }
    
    func updateElorating(newElorating elo:Double){
        self.eloRating = elo
    }

}
