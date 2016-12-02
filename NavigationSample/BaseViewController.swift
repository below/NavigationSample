//
//  BaseViewController.swift
//  NavigationSample
//
//  Created by Alexander v. Below on 21.11.16.
//  Copyright © 2016 Alexander von Below. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var pushDeep = false
    
    @IBAction func showAlert (sender : UIControl?) {
        if let navController = self.navigationController as? NavigationController {
            navController.showAlert(sender: sender)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if pushDeep {
            performSegue(withIdentifier: "goDeeper", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BaseViewController {
            destination.pushDeep = self.pushDeep
            self.pushDeep = false
        }
    }
}
