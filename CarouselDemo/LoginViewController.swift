//
//  LoginViewController.swift
//  CarouselDemo
//
//  Created by Scott Horsfall on 5/25/16.
//  Copyright © 2016 Scott Horsfall. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var loginNavBar: UIImageView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
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
        
        initialFieldY = fieldParentView.frame.origin.y
        offset = -100
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -220
    }
    
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialFieldY + offset
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialFieldY
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }

    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {

        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            // fields are empty, define alert
            let emptyAlertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
            
            // some extra login alerts
            if emailField.text!.isEmpty && passwordField.text!.isEmpty {
                // both empty
                emptyAlertController.title = "Login Required"
                emptyAlertController.message = "Please enter your email and password"
            } else if emailField.text!.isEmpty {
                // email empty
                emptyAlertController.title = "Email Required"
                emptyAlertController.message = "Please enter your email address"
                
            } else {
                // password empty
                emptyAlertController.title = "Password Required"
                emptyAlertController.message = "Please enter your password"
            }
            
            // create actions
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            
            // add buttons to alert
            emptyAlertController.addAction(cancelAction)
            emptyAlertController.addAction(OKAction)
            
            presentViewController(emptyAlertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        } else {
            // NOT EMPTY
            loginIndicator.startAnimating()
            loginButton.selected = true
        
            if emailField.text == "scohorsfall@gmail.com" && passwordField.text == "pass" {
                // right
            
                delay(2, closure: { () -> () in
                    self.loginIndicator.stopAnimating()
                    self.loginButton.selected = false
                    self.performSegueWithIdentifier("logmeinSegue", sender: nil)
                })
            } else {
                // wrong
            
                delay(2, closure: { () -> () in
                    self.loginIndicator.stopAnimating()
                    self.loginButton.selected = false
                
                    let loginAlertController = UIAlertController(title: "Invalid Email or Password", message: "Please enter a valid email and password", preferredStyle: .Alert)

                
                    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                    }
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                        // handle response here.
                    }
                
                    loginAlertController.addAction(cancelAction)
                    loginAlertController.addAction(OKAction)
                
                    self.presentViewController(loginAlertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                })
            }
        }
        
    }
}
