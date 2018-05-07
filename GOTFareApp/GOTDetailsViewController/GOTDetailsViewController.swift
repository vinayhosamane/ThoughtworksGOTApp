//
//  GOTDetailsViewController.swift
//  GOTFareApp
//
//  Created by K N Hosamane, Vinay on 5/7/18.
//  Copyright © 2018 Hosamane K N, Vinay. All rights reserved.
//

import UIKit

class GOTDetailsViewController: UIViewController {
    
    @IBOutlet weak var kingBannerImage: UIImageView!
    
    @IBOutlet weak var kingProfileDetailsTableView: UITableView!
    
    @IBOutlet weak var kingsELORating: UILabel!
    
    var kingProfile: King?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.title = kingProfile?.kingName
    
        self.kingBannerImage.image = kingProfile?.bannerImage!
        self.kingsELORating.text = String(format: "%0.2f", (kingProfile?.eloRating)!)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
