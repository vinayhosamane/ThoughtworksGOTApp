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
}

var battlesList:[Battle]?


let GOTService:GOTServiceHelper = GOTServiceHelper()

class GameofthronesViewControllerViewModel: loadGOTData {
   
    //Load data from web service
    func loadGameofthronesDataFromWebService() {
        
        GOTService.load(withSuccess: { (allKings) in
            
            battlesList = allKings
    
            DispatchQueue.main.async {
                //reload the tableview data
            }
        }) { (error) in
            print(error)
        }
    }
    
    //get number of rows for tableview
    func getNumberOfRows(Section: Int) -> Int? {
        guard let battles = battlesList else {
            return nil
        }
        
        return battles.count
    }
    
}


