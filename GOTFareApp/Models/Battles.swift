//
//  KingProfile.swift
//  GOTFareApp
//
//  Created by K N Hosamane, Vinay on 5/5/18.
//  Copyright © 2018 Hosamane K N, Vinay. All rights reserved.
//

import Foundation
import  UIKit

struct BattleTypesLiteral {
    static let name = "name"
    static let year = "year"
    static let battle_number = "battle_number"
    static let attacker_king = "attacker_king"
    static let defender_king = "defender_king"
    static let attacker_1 = "attacker_1"
    static let attacker_2 = "attacker_2"
    static let attacker_3 = "attacker_3"
    static let attacker_4 = "attacker_4"
    static let defender_1 = "defender_1"
    static let defender_2 = "defender_2"
    static let defender_3  = "defender_3"
    static let defender_4 = "defender_4"
    static let attacker_outcome = "attacker_outcome"
    static let battle_type = "battle_type"
    static let major_death = "major_death"
    static let major_capture = "major_capture"
    static let attacker_size = "attacker_size"
    static let defender_size = "defender_size"
    static let attacker_commander = "attacker_commander"
    static let defender_commander = "defender_commander"
    static let summer = "summer"
    static let location = "location"
    static let region = "region"
    static let note = "note"
    static let elo_rating = "elo_rating"
}

class Battle {
    var name:String?
    var year:Int?
    var battle_number:Int?
    var attacker_king:King?
    var defender_king:King?
    var attacker_1:String?
    var attacker_2:String?
    var attacker_3:String?
    var attacker_4:String?
    var defender_1:String?
    var defender_2:String?
    var defender_3:String?
    var defender_4:String?
    var attacker_outcome:String?
    var battle_type:String?
    var major_death:Int?
    var major_capture:Int?
    var attacker_size:String?
    var defender_size:String?
    var attacker_commander:String?
    var defender_commander:String?
    var summer:String?
    var location:String?
    var region:String?
    var note:String?
    var elo_rating:Int?
    
    init?(_ jsondata: [String: AnyObject]) {
        
        guard let name = jsondata[BattleTypesLiteral.name] as? String,
            let  year = jsondata[BattleTypesLiteral.year] as? Int,
            let battle_number = jsondata[BattleTypesLiteral.battle_number] as? Int,
            let attacker_king = jsondata[BattleTypesLiteral.attacker_king] as? String, !(attacker_king).isEmpty,
            let defender_king = jsondata[BattleTypesLiteral.defender_king] as? String, !(defender_king).isEmpty,
            let attacker_1 = jsondata[BattleTypesLiteral.attacker_1] as? String,
            let attacker_2 = jsondata[BattleTypesLiteral.attacker_2] as? String,
            let attacker_3 = jsondata[BattleTypesLiteral.attacker_3] as? String,
            let attacker_4 = jsondata[BattleTypesLiteral.attacker_4] as? String,
            let defender_1 = jsondata[BattleTypesLiteral.defender_1] as? String,
            let defender_2 = jsondata[BattleTypesLiteral.defender_2] as? String,
            let defender_3 = jsondata[BattleTypesLiteral.defender_3] as? String,
            let defender_4 = jsondata[BattleTypesLiteral.defender_4] as? String,
            let attacker_outcome = jsondata[BattleTypesLiteral.attacker_outcome] as? String,
            let battle_type = jsondata[BattleTypesLiteral.battle_type] as? String,
            let major_death = jsondata[BattleTypesLiteral.major_death] as? Int,
            let major_capture = jsondata[BattleTypesLiteral.major_capture] as? Int,
            let attacker_size = jsondata[BattleTypesLiteral.attacker_size] as? String,
            let defender_size = jsondata[BattleTypesLiteral.defender_size] as? String,
            let attacker_commander = jsondata[BattleTypesLiteral.attacker_commander] as? String,
            let defender_commander = jsondata[BattleTypesLiteral.defender_commander] as? String,
            let summer = jsondata[BattleTypesLiteral.summer] as? String,
            let location = jsondata[BattleTypesLiteral.location] as? String,
            let region = jsondata[BattleTypesLiteral.region] as? String,
            let note = jsondata[BattleTypesLiteral.note] as? String  else {
                return nil
        }
        
        self.name = name
        self.year = year
        self.battle_number = battle_number
        
        self.attacker_1 = attacker_1
        self.attacker_2 = attacker_2
        self.attacker_3 = attacker_3
        self.attacker_4 = attacker_4
        self.defender_1 = defender_1
        self.defender_2 = defender_2
        self.defender_3 = defender_3
        self.defender_4 = defender_4
        self.attacker_outcome = attacker_outcome
        self.battle_type = battle_type
        self.major_death = major_death
        self.major_capture = major_capture
        self.attacker_size = attacker_size
        self.defender_size = defender_size
        self.attacker_commander = attacker_commander
        self.defender_commander = defender_commander
        self.summer = summer
        self.location = location
        self.region = region
        self.note = note
        
        self.attacker_king = self.checkKingExistsOrNot(name: attacker_king)
        self.defender_king = self.checkKingExistsOrNot(name: defender_king)
        
        //Increase the count of no of attacks and defence for attacker and defender
        self.attacker_king?.totalAttacks = 1
        self.defender_king?.totalDefence = 1
        
        //Increae the count of no of wins and losses for attacker and defender
        if(attacker_outcome == "win"){
            self.attacker_king?.totalWins = 1
            self.defender_king?.totalLoss = 1
            self.attacker_king?.totalAttacksWon = 1
        }else if (attacker_outcome == "loss"){
            self.attacker_king?.totalLoss = 1
            self.defender_king?.totalWins  = 1
            self.defender_king?.totalDefenceWon = 1
        }
        
        ELOCalculator.calculateELORating(attackedBy: self.attacker_king!, defendedBy: self.defender_king!, attackerWon: self.getBattleOutcome(outcome: attacker_outcome), defenderWon: self.getBattleOutcome(outcome: attacker_outcome), itsDraw: self.getBattleOutcome(outcome: attacker_outcome))
        
    }
    
    func checkKingExistsOrNot(name:String) -> King? {
        let kings = GameofthronesViewControllerViewModel.getAllKings()
        
        for king in kings {
            if(king.kingName == name){
                return king
            }
        }
        
        let newKing = King(kingName: name, bannerImage:self.getImageForKing(kingName: name) )
        
        GameofthronesViewControllerViewModel.addNewKingToList(king: newKing!)
        
        return newKing
    }
    
    func getImageForKing(kingName: String) -> UIImage? {
        
        var img:UIImage?
        
        switch(kingName){
        case "Joffrey/Tommen Baratheon": do {
            img = #imageLiteral(resourceName: "Lannister")
            break
            }
        case "Balon/Euron Greyjoy": do {
            img = #imageLiteral(resourceName: "Greyjoy")
            break
            }
        case "Mance Rayder": do {
            img = #imageLiteral(resourceName: "Mance")
            break
            }
        case "Stannis Baratheon": do {
            img = #imageLiteral(resourceName: "Stannis")
            break
            }
        case "Renly Baratheon": do {
            img = #imageLiteral(resourceName: "Renly")
            break
            }
        case "Robb Stark": do {
            img =  #imageLiteral(resourceName: "Stark")
            break
            }
        default:
            img = #imageLiteral(resourceName: "Stark")
            break
        }
        
        return img
        
    }
    
    func getBattleOutcome(outcome:String) -> Battle_Outcome {
        if (outcome == "win") {
            return .WON
        }else if (outcome == "loss"){
            return .LOSS
        }else {
            return .DRAW
        }
    }
    
    
}



