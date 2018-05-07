//
//  BussinessLogic.swift
//  GOTFareApp
//
//  Created by K N Hosamane, Vinay on 5/6/18.
//  Copyright © 2018 Hosamane K N, Vinay. All rights reserved.
//

import Foundation
import UIKit

protocol ELORatingCalculatorProtocol {
  static  func calculateELORating(attackedBy attacker: King,defendedBy defender: King, attackerWon attackerwon:Battle_Outcome, defenderWon defenderwon:Battle_Outcome , itsDraw draw:Battle_Outcome)
}

class ELOCalculator: ELORatingCalculatorProtocol {
    
    //4 Steps in ELO Calculation
    /*
     r1 -> rating of player 1
     r2 -> rating of player 2
     Step 1:
     R1 = 10 ^^ (r1/400)
     R2 = 10 ^^ (r2/400)
     
     Step 2:
     E1 = R1 / (R1 + R2)
     E2 = R2 / (R1 + R2)
     
     Step 3:
     S1 = 1(win) = 0(lose) = 0.5(draw)
     S2 = 1(win) = 0(lose) = 0.5(draw)
     
     Step 4: Updated Elo Rating   Where k = 32
     r'1 = r1 + k (S1 - E1)
     r'2 = r2 + k (S2 - E2)
     */
    
    
   static func calculateELORating(attackedBy attacker: King,defendedBy defender: King, attackerWon attackerwon:Battle_Outcome, defenderWon defenderwon:Battle_Outcome , itsDraw draw:Battle_Outcome) {
        
        //Retrive the current rating of the player
        var r1:Double = Double(attacker.eloRating)
        var r2:Double = Double(defender.eloRating)
        
        //Step 1
        let R1:Double = pow(10.0, (r1/400))
        let R2:Double = pow(10.0, (r2/400))
        
        //Step 2
        let E1:Double = R1 / (R1 + R2)
        let E2:Double = R2 / (R1 + R2)
        
        //Step 3
        var S1 = 0.0
        var S2 = 0.0
        if(attackerwon == .WON){
            S1 = 1.0
        }else if (defenderwon == .LOSS) {
            S2 = 1.0
        } else if (draw == .DRAW) {
            S1 = 0.5
            S2 = 0.5
        } else {
            //do nothing
        }
        
        //Step 4
        //Updating the Elo Rating
        r1 = r1 + 32 * (S1 - E1)
        r2 = r2 + 32 * (S2 - E2)
        
        attacker.eloRating = r1
        defender.eloRating = r2
        
    }
    
}
