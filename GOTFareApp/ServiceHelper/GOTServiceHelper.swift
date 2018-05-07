//
//  GOTServiceHelper.swift
//  GOTFareApp
//
//  Created by K N Hosamane, Vinay on 5/5/18.
//  Copyright © 2018 Hosamane K N, Vinay. All rights reserved.
//

import Foundation
import UIKit

enum Battle_Outcome {
    case WON
    case LOSS
    case DRAW
}

protocol NetworkRequestProtocol {
    
    func load(withSuccess SuccessBlock: @escaping ([King]) -> (),withFailure ErrorBlock: (NSError)->())
    func makeModel(kingJson: [String: AnyObject])
    
}

var kingModels = [Battle]()
var kingsList = [King]()

class GOTServiceHelper:NetworkRequestProtocol {

    var url: URL {
        let baseUrl = "http://starlord.hackerearth.com/gotjson"
        return URL(string: baseUrl)!
    }
    
    func load(withSuccess SuccessBlock: @escaping ([King]) -> (),withFailure ErrorBlock: (NSError)->() ) {
        
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
                self?.makeModel(kingJson: dic as [String: AnyObject])
            }
            
            for k in kingsList {
                print(k.eloRating)
            }
            
            kingsList = kingsList.sorted(by: { (a, b) -> Bool in
                return a.eloRating > b.eloRating
            })
            
            SuccessBlock(kingsList)

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

}
