//
//  SettingsViewController.swift
//  CarouselDemo
//
//  Created by Scott Horsfall on 5/27/16.
//  Copyright © 2016 Scott Horsfall. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = imageView.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onCloseTap(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSignoutTap(sender: AnyObject) {
        
        let signoutAlert = UIAlertController(title: nil, message: "Are you sure you want to signout?", preferredStyle: .ActionSheet)
        
        let signoutAction = UIAlertAction(title: "Sign Out", style: .Destructive) { (action) in
            // handle case of user logging out
            self.performSegueWithIdentifier("logoutSegue", sender: self)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        
        // add buttons
        signoutAlert.addAction(signoutAction)
        signoutAlert.addAction(cancelAction)
        
        presentViewController(signoutAlert, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
    }
}
