//
//  ViewController.swift
//  GOTFareApp
//
//  Created by K N Hosamane, Vinay on 5/5/18.
//  Copyright © 2018 Hosamane K N, Vinay. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
 
    let GOTViewModel = GameofthronesViewControllerViewModel()
    
    @IBOutlet weak var gotTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.yellow
        
        GOTViewModel.loadGameofthronesDataFromWebService()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GOTViewModel.getNumberOfRows(Section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 166
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "GOT_CELL", for: indexPath) as? GOTTableViewCell
        
        cell?.kingNameLabel.text = GOTViewModel.getKingName(index:indexPath.item)
        cell?.kingEloRatingLabel.text = GOTViewModel.getKingEloRating(index:indexPath.item)
        cell?.kingTotalAttacksLabel.text = GOTViewModel.getKingTotalAttacks(index: indexPath.item)
        cell?.kingTotalDefenceLabel.text = GOTViewModel.getKingTotalDefence(index: indexPath.item)
        cell?.kingTotalWinsLabel.text = GOTViewModel.getKingTotalWins(index: indexPath.item)
        cell?.kingBanerImage.image = #imageLiteral(resourceName: "Stark")
        
        return cell!
        }


}

