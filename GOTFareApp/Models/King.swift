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
    
    private var _totalDefence:Int
    var totalDefence:Int {
        set {
            _totalDefence = _totalDefence + newValue
        }
        get {
            return _totalDefence
        }
    }
    
    private var _totalDefenceWon:Int
    var totalDefenceWon:Int {
        set {
            _totalDefenceWon = _totalDefenceWon + newValue
        }
        get {
            return _totalDefenceWon
        }
    }
    
    private var _totalAttacks:Int
    var totalAttacks:Int {
        set {
            _totalAttacks = _totalAttacks + newValue
        }
        get {
            return _totalAttacks
        }
    }
    
    private var _totalAttacksWon:Int
    var totalAttacksWon:Int {
        set {
            _totalAttacksWon = _totalAttacksWon + newValue
        }
        get {
            return _totalAttacksWon
        }
    }

    var bannerImage: UIImage?
    
    private var _totalWins:Int
    var totalWins:Int {
        set {
            _totalWins = _totalWins + newValue
        }
        get {
            return _totalWins
        }
    }
    
    private var _totalLoss:Int
    var totalLoss:Int {
        set {
            _totalLoss = _totalLoss + newValue
        }
        get {
            return _totalLoss
        }
    }

    private var _eloRating:Double //= 400.0
    var eloRating: Double {
        set{
            _eloRating=newValue
        }
        get{
            return _eloRating
        }
    }
    
    var battles:[Battle]
    
    init?(kingName:String?,bannerImage:UIImage?) {
        _eloRating = 400.0
          battles = []
        _totalDefence = 0
        _totalAttacks = 0
        _totalLoss = 0
        _totalWins = 0
        _totalAttacksWon = 0
        _totalDefenceWon = 0
        
        super.init()
        
        self.kingName = kingName
        self.bannerImage = bannerImage
    }

}
