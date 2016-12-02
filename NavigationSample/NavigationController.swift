//
//  NavigationController.swift
//  NavigationSample
//
//  Created by Alexander v. Below on 21.11.16.
//  Copyright © 2016 Alexander von Below. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    @IBAction func showAlert (sender : UIControl?) {
        self.performSegue(withIdentifier: "showAlarm", sender: self)
    }
    
    func goDeepest () {
        self.popToRootViewController(animated: false)
        if let firstController = self.viewControllers.first as? BaseViewController {
            
            firstController.pushDeep = true
            firstController.performSegue(withIdentifier: "goDeeper", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let alarmDialog = segue.destination as? AlertViewController {
            alarmDialog.myNavController = self
        }
    }
}
