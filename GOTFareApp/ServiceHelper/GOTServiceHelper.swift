//
//  GOTServiceHelper.swift
//  GOTFareApp
//
//  Created by K N Hosamane, Vinay on 5/5/18.
//  Copyright © 2018 Hosamane K N, Vinay. All rights reserved.
//

import Foundation
import UIKit

protocol NetworkRequestProtocol {
    
    func load(withSuccess SuccessBlock: @escaping ([King]) -> (),withFailure ErrorBlock: @escaping (NSError)->())
    func makeModel(kingJson: [String: AnyObject])
    
}

var kingModels = [Battle]()
var kingsList = [King]()

class GOTServiceHelper:NetworkRequestProtocol {
    
    var url: URL {
        let baseUrl = "http://starlord.hackerearth.com/gotjson"
        return URL(string: baseUrl)!
    }
    
    func load(withSuccess SuccessBlock: @escaping ([King]) -> (),withFailure ErrorBlock: @escaping (NSError)->() ) {
        
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?)  -> Void in
           
            guard let data = data else {
                // completion(nil)
                return
            }
                        
            guard let json = try? JSONSerialization.jsonObject(with: data, options: [ ])  else {
                return
            }
            
            guard let jsonArray = json as? [[String: AnyObject]] else {
                return
            }
            print(jsonArray)
            
            //Populate models for Battle
            for dic in jsonArray{
                print(dic) //Output
                self?.makeModel(kingJson: dic as [String: AnyObject])
            }
            
            //Calculating rating of kings
            self?.filterUniquenamesInTheArray()
 
            print(kingModels)
            
            DispatchQueue.main.async {
                SuccessBlock(kingsList)
            }
            
            // completion(self?.decode(data))
        })
        task.resume()
        
    }
    
    func makeModel(kingJson: [String: AnyObject])  {
        
        guard  let myBattle = Battle(kingJson) else {
            //do nothing just dont add it to array
            return
        }
        
        kingModels.append(myBattle)
        
    }
    
    func filterUniquenamesInTheArray() {
        var testArray = [String]()
        
        for item in kingModels {
            if testArray.contains(item.attacker_king!) {
                //dont add
            }
            else {
                testArray.append(item.attacker_king!)
               kingsList.append(King(kingName: item.attacker_king, bannerImage: self.getImageForKing(kingName: item.attacker_king!))!)
            }
            
            if testArray.contains(item.defender_king!) {
                //dont add
            }
            else {
                testArray.append(item.defender_king!)
                 kingsList.append(King(kingName: item.defender_king, bannerImage: self.getImageForKing(kingName: item.defender_king!))!)
            }
        }
        
        print(testArray)
        
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
    
}
