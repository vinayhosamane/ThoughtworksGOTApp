//
//  ActivityIndicatorView.swift
//  GOTFareApp
//
//  Created by K N Hosamane, Vinay on 5/8/18.
//  Copyright © 2018 Hosamane K N, Vinay. All rights reserved.
//

import Foundation
import UIKit

protocol ActivityIndicatorProtocol {
    func addActivityIndicatorToView(view: UIView)
    func removeActivityIndicatorFromView()
    }

class ActivityIndicatorView:ActivityIndicatorProtocol {
    
    let activityLoaderView:UIActivityIndicatorView?
    
    init() {
        activityLoaderView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    }
    
    func addActivityIndicatorToView(view: UIView) {
        activityLoaderView?.center = view.center
        activityLoaderView?.startAnimating()
        view.addSubview(activityLoaderView!)
    }
    
    func removeActivityIndicatorFromView() {
        activityLoaderView?.stopAnimating()
        self.activityLoaderView?.removeFromSuperview()
       }
    
}



