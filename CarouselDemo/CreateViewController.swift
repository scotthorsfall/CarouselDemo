//
//  CreateViewController.swift
//  CarouselDemo
//
//  Created by Scott Horsfall on 5/30/16.
//  Copyright © 2016 Scott Horsfall. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var formParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var checkBoxTerms: UIButton!
    
    // variables for initial y and offset
    var initialFieldY: CGFloat!
    var offset: CGFloat!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
        
        initialFieldY = formParentView.frame.origin.y
        offset = -80
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -228
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backButtonTap(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        formParentView.frame.origin.y = initialFieldY + offset
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        formParentView.frame.origin.y = initialFieldY
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    @IBAction func onCheckboxTap(sender: UIButton) {
        if sender.selected {
           sender.selected = !sender.selected
        } else {
            sender.selected = true
        }
    }
    
    @IBAction func onCreateTap(sender: AnyObject) {
        if firstnameField.text!.isEmpty || lastnameField.text!.isEmpty || emailField.text!.isEmpty || passwordField.text!.isEmpty {
            
            let emptyAlertController = UIAlertController(title: "Missing Information", message: "Please fill out all form fields.", preferredStyle: .Alert)
            
            // create actions
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            
            // add buttons to alert
            emptyAlertController.addAction(OKAction)
            
            presentViewController(emptyAlertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        } else if !checkBoxTerms.selected {
            let termsAlertController = UIAlertController(title: "Read Terms", message: "Please read the terms and conditions before creating an account.", preferredStyle: .Alert)
            
            // create actions
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            
            // add buttons to alert
            termsAlertController.addAction(OKAction)
            
            presentViewController(termsAlertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
        } else {
            // this should delay with an activity indicator too
            self.performSegueWithIdentifier("createSegue", sender: nil)
        }
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}
