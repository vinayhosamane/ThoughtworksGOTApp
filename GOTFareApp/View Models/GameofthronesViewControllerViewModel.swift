//
//  GameofthronesViewControllerViewModel.swift
//  GOTFareApp
//
//  Created by K N Hosamane, Vinay on 5/6/18.
//  Copyright © 2018 Hosamane K N, Vinay. All rights reserved.
//

import Foundation
import UIKit

protocol loadGOTData {
    func loadGameofthronesDataFromWebService()
    func getNumberOfRows(Section:Int) -> Int?
    func getKingName(index: Int) -> String
    func getKingEloRating(index:Int) -> String
    func getKingTotalAttacks(index: Int) -> String
    func getKingTotalDefence(index: Int) -> String
    func getKingTotalWins(index: Int) -> String
    func getKingBannerImage(index: Int) -> UIImage
}

var battlesList:[Battle]?
var kingsList: [King]?


let GOTService:GOTServiceHelper = GOTServiceHelper()

class GameofthronesViewControllerViewModel: loadGOTData {
    func getKingName(index: Int) -> String {
       // return kingsList![index].kingName!
        return "Joffrey/Tommen Baratheon"
    }
    
    func getKingEloRating(index: Int) -> String {
       // return String(kingsList![index].eloRating)
        return "143.0"
    }
    
    func getKingTotalAttacks(index: Int) -> String {
      //  return String(describing: kingsList![index].totalAttacks)
        return "12"
    }
    
    func getKingTotalDefence(index: Int) -> String {
       // return String(describing: kingsList![index].totalDefence)
        return "10"
    }
    
    func getKingTotalWins(index: Int) -> String {
      //  return String(kingsList![index].totalWins)
        return "9"
    }
    
    func getKingBannerImage(index: Int) -> UIImage {
       // return UIImage(imageLiteralResourceName: kingsList![index].bannerImage!)
        return UIImage(named: "Stark")!
    }
    
   
    //Load data from web service
    func loadGameofthronesDataFromWebService() {
        
        GOTService.load(withSuccess: { (allKings) in
            
            battlesList = allKings
            //Apply bussiness Logic
            
           
        }) { (error) in
            print(error)
        }
    }
    
    //get number of rows for tableview
    func getNumberOfRows(Section: Int) -> Int? {
//        guard let kings = kingsList else {
//            return nil
//        }
        
       // return kings.count
        
        return 5
    }
    
}


