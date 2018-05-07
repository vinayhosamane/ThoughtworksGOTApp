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
    func  takeMeToKingProfileScreen(table:UITableView, index:IndexPath) -> GOTDetailsViewController
}

var battlesList:[Battle]?
var allKings = [King]()


let GOTService:GOTServiceHelper = GOTServiceHelper()

class GameofthronesViewControllerViewModel: loadGOTData {
    var tableDelegate:ViewController?
    
    func getKingName(index: Int) -> String {
        return allKings[index].kingName!
    }
    
    func getKingEloRating(index: Int) -> String {
        return String(format: "%.2f", allKings[index].eloRating)
    }
    
    func getKingTotalAttacks(index: Int) -> String {
        return String(format: "%d", allKings[index].totalAttacks)
    }
    
    func getKingTotalDefence(index: Int) -> String {
        return String(format: "%d", allKings[index].totalDefence)
    }
    
    func getKingTotalWins(index: Int) -> String {
       return String(format: "%d", allKings[index].totalWins)
    }
    
    func getKingBannerImage(index: Int) -> UIImage {
        return allKings[index].bannerImage!
    }
    
    //Load data from web service
    func loadGameofthronesDataFromWebService() {
        
        GOTService.load(withSuccess: { (kings) in
            allKings = kings
            DispatchQueue.main.async {
                self.tableDelegate?.gotTableView.reloadData()
            }
            
        }) { (error) in
            print(error)
        }
    }
    
    //get number of rows for tableview
    func getNumberOfRows(Section: Int) -> Int? {
       return allKings.count
    }
    
    func takeMeToKingProfileScreen(table: UITableView, index: IndexPath) -> GOTDetailsViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let profileScreen = storyBoard.instantiateViewController(withIdentifier: "GOTDetails") as! GOTDetailsViewController
        
        profileScreen.kingProfile = kingsList[index.item]
        
        return profileScreen
    }
    
  class  func getAllKings() -> [King] {
        return kingsList
    }
    
    class func addNewKingToList(king:King) {
        kingsList.append(king)
    }
    
}


