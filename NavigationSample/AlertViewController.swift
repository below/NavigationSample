//
//  AlertViewController.swift
//  NavigationSample
//
//  Created by Alexander v. Below on 21.11.16.
//  Copyright © 2016 Alexander von Below. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    var myNavController: NavigationController!
    
    @IBAction func justDismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goDeepest(_ sender: UIButton) {
        self.dismiss(animated: true) {
            
            self.myNavController.goDeepest()
        }
    }
}
