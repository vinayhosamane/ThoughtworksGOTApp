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
    let activityLoader = ActivityIndicatorView.init()
    
    @IBOutlet weak var gotTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GOTViewModel.tableDelegate = self
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.yellow
        
      //  activityLoader.addActivityIndicatorToView(view: self.view)
        GOTViewModel.loadGameofthronesDataFromWebService(from: self)
//         activityLoader.removeActivityIndicatorFromView()
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
        
        cell?.kingNameLabel.text = GOTViewModel.getKingName(index:indexPath.row)
        cell?.kingEloRatingLabel.text = GOTViewModel.getKingEloRating(index:indexPath.row)
        cell?.kingTotalAttacksLabel.text = GOTViewModel.getKingTotalAttacks(index: indexPath.row)
        cell?.kingTotalDefenceLabel.text = GOTViewModel.getKingTotalDefence(index: indexPath.row)
        cell?.kingTotalWinsLabel.text = GOTViewModel.getKingTotalWins(index: indexPath.row)
        cell?.kingBanerImage.image = GOTViewModel.getKingBannerImage(index: indexPath.row)
        
        return cell!
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let detailsScreen =  GOTViewModel.takeMeToKingProfileScreen(table:tableView, index:indexPath)
       
        self.navigationController?.pushViewController(detailsScreen, animated: true)
    }
}

