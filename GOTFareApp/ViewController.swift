//
//  ViewController.swift
//  GOTFareApp
//
//  Created by K N Hosamane, Vinay on 5/5/18.
//  Copyright © 2018 Hosamane K N, Vinay. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
 
    var GOTViewModel = GameofthronesViewControllerViewModel()
    
    @IBOutlet weak var gotTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GOTViewModel.tableDelegate = self
        
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
        
        cell?.accessoryType = .disclosureIndicator
        
        cell?.kingNameLabel.text = GOTViewModel.getKingName(index:indexPath.item)
        cell?.kingEloRatingLabel.text = GOTViewModel.getKingEloRating(index:indexPath.item)
        cell?.kingTotalAttacksLabel.text = GOTViewModel.getKingTotalAttacks(index: indexPath.item)
        cell?.kingTotalDefenceLabel.text = GOTViewModel.getKingTotalDefence(index: indexPath.item)
        cell?.kingTotalWinsLabel.text = GOTViewModel.getKingTotalWins(index: indexPath.item)
        cell?.kingBanerImage.image = GOTViewModel.getKingBannerImage(index: indexPath.item)
        
        return cell!
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      var detailsScreen =  GOTViewModel.takeMeToKingProfileScreen(table:tableView, index:indexPath)
       
        self.navigationController?.pushViewController(detailsScreen, animated: true)
    }
}

