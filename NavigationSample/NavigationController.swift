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
    
    // I'm using the storyboard ids here.
    // Note that there are no longer any deep_push segues in the storyboard.
    let path = ["first_level", "second_level"]
    
    // Turns out it helps to have the root view controller in place as well.
    var controllers : [UIViewController] = [self.viewControllers[0]]
    
    for element in path {
      let controller = self.storyboard!.instantiateViewController(withIdentifier: element)
      controllers.append(controller)
    }
    
    // This is supposed to be the best way to set a different "stack", according 
    // to some docs I no longer seem to be able to find.
    self.setViewControllers(controllers, animated: true)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let alarmDialog = segue.destination as? AlertViewController {
      alarmDialog.myNavController = self
    }
  }
}
