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
        
        GOTViewModel.loadGameofthronesDataFromWebService()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GOTViewModel.getNumberOfRows(Section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

    

}

