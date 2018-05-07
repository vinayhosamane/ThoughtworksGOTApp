//
//  GOTDetailsViewController.swift
//  GOTFareApp
//
//  Created by K N Hosamane, Vinay on 5/7/18.
//  Copyright © 2018 Hosamane K N, Vinay. All rights reserved.
//

import UIKit

class GOTDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet weak var kingBannerImage: UIImageView!
    
    @IBOutlet weak var kingProfileDetailsTableView: UITableView!
    
    @IBOutlet weak var kingsELORating: UILabel!
    
    var kingProfile: King?
    var rowLabelNames = [String]()
    var rowScoreDetails = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        rowLabelNames = ["Attacks Made","Defended","Total Wins","Total Loss","Attacks Won","Defended Successfully"]

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.title = kingProfile?.kingName
    
        self.kingBannerImage.image = kingProfile?.bannerImage!
        self.kingsELORating.text = String(format: "%0.2f", (kingProfile?.eloRating)!)
        
        rowScoreDetails = [String(format: "%d", (kingProfile?.totalAttacks)!), String(format: "%d", (kingProfile?.totalDefence)!), String(format: "%d", (kingProfile?.totalWins)!),String(format: "%d", (kingProfile?.totalLoss)!), String(format: "%d", (kingProfile?.totalAttacksWon)!),String(format: "%d", (kingProfile?.totalDefenceWon)!)]
        
        self.kingProfileDetailsTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowLabelNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "GOT_DETAILS", for: indexPath) as! GOTDetailsTableCell
        cell.profileTypeLabel?.text = rowLabelNames[indexPath.row]
        cell.profileTypeScoreLabel?.text = rowScoreDetails[indexPath.row]
        
        return cell
        
    }

}
