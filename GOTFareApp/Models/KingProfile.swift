//
//  KingProfile.swift
//  GOTFareApp
//
//  Created by K N Hosamane, Vinay on 5/5/18.
//  Copyright © 2018 Hosamane K N, Vinay. All rights reserved.
//

import Foundation

class Battle: Decodable {
    var name:String?
    var year:Int?
    var battle_number:Int?
    var attacker_king:String?
    var defender_king:String?
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
        
        guard let name = jsondata["name"] as? String,
            let  year = jsondata["year"] as? Int,
            let battle_number = jsondata["battle_number"] as? Int,
            let attacker_king = jsondata["attacker_king"] as? String, !(attacker_king).isEmpty,
            let defender_king = jsondata["defender_king"] as? String, !(defender_king).isEmpty,
            let attacker_1 = jsondata["attacker_1"] as? String,
            let attacker_2 = jsondata["attacker_2"] as? String,
            let attacker_3 = jsondata["attacker_3"] as? String,
            let attacker_4 = jsondata["attacker_4"] as? String,
            let defender_1 = jsondata["defender_1"] as? String,
            let defender_2 = jsondata["defender_2"] as? String,
            let defender_3 = jsondata["defender_3"] as? String,
            let defender_4 = jsondata["defender_4"] as? String,
            let attacker_outcome = jsondata["attacker_outcome"] as? String,
            let battle_type = jsondata["battle_type"] as? String,
            let major_death = jsondata["major_death"] as? Int,
            let major_capture = jsondata["major_capture"] as? Int,
            let attacker_size = jsondata["attacker_size"] as? String,
            let defender_size = jsondata["defender_size"] as? String,
            let attacker_commander = jsondata["attacker_commander"] as? String,
            let defender_commander = jsondata["defender_commander"] as? String,
            let summer = jsondata["summer"] as? String,
            let location = jsondata["location"] as? String,
            let region = jsondata["region"] as? String,
            let note = jsondata["note"] as? String  else {
                return nil
        }
        
        self.name = name
        self.year = year
        self.battle_number = battle_number
        self.attacker_king = attacker_king
        self.defender_king = defender_king
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
    }
    
    
    
}


