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
    var totalDefence: Int?
    var totalAttacks:Int?
    var bannerImage: String?
    
    var totalWins: Int = 0
    var totalLoss: Int = 0
    var eloRating: Int = 400
    
    init?(kingName:String?,totalDefence:Int?,totalAttacks:Int?,totalWins:Int?,totalLoss:Int?,bannerImage:String?) {
        
        super.init()
        
        guard let kingName = !(kingName?.isEmpty)! ? kingName : nil,
                  let totalDefence = totalDefence,
                  let totalAttacks = totalAttacks,
                  let totalWins = totalWins,
                  let bannerImage = bannerImage,
                  let totalLoss = totalLoss else {
                return
        }
        
        self.kingName = kingName
        self.totalDefence = totalDefence
        self.totalAttacks = totalAttacks
        self.totalLoss = totalLoss
        self.totalWins = totalWins
        self.bannerImage = bannerImage
    }
    
    func updateElorating(newElorating elo:Int){
        self.eloRating = elo
    }
    
}
