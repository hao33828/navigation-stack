//
//  FirstTableViewController.swift
//  NavigationStackDemo
//
//  Created by Alex K. on 29/02/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit

// MARK: FirstTableViewController

class FirstTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController!.interactivePopGestureRecognizer?.delegate = self
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    if let navigationController = navigationController {
      navigationController.navigationBar.barTintColor = UIColor(red:0.4, green:0.47, blue:0.62, alpha:1)
    }
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    performSegueWithIdentifier("push", sender: nil)
  }
  
}

// MARK: UIGestureRecognizerDelegate

extension FirstTableViewController: UIGestureRecognizerDelegate {
  func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
    
    if navigationController?.viewControllers.count == 2 {
      return true
    }
    
    if let navigationController = self.navigationController as? NavigationStack {
      navigationController.showControllers()
    }
    
    return false
  }
}
