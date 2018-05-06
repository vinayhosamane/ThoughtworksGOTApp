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
    
    var totalWins: Int = 0
    var totalLoss: Int = 0
    var eloRating: Int = 1000
    
    init?(kingName:String?,totalDefence:Int?,totalAttacks:Int?,totalWins:Int?,totalLoss:Int?) {
        
        super.init()
        
        guard let kingName = !(kingName?.isEmpty)! ? kingName : nil,
                  let totalDefence = totalDefence,
                  let totalAttacks = totalAttacks,
                  let totalWins = totalWins,
                  let totalLoss = totalLoss else {
                return
        }
        
        self.kingName = kingName
        self.totalDefence = totalDefence
        self.totalAttacks = totalAttacks
        self.totalLoss = totalLoss
        self.totalWins = totalWins
    }
    
    func calculateEloRating(whoAttacked Attacker:King, whoDefended Defender:King, whoWon Winner:King, whoLost Loser:King) {
        
        Winner.eloRating = (Winner.eloRating + 400)
        
    }
    
}
