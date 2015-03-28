//
//  ViewController.swift
//  Tinder
//
//  Created by Sterling Savariau on 11/5/14.
//  Copyright (c) 2014 Sterling Savariau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginCancelledLabel: UILabel!
    
    @IBAction func signIn(sender: AnyObject) {
        
        var permissions = ["public_profile"]
        
        self.loginCancelledLabel.alpha = 0
        
        PFFacebookUtils.logInWithPermissions(permissions, {
            (user: PFUser!, error: NSError!) -> Void in
            if user == nil {
                NSLog("Uh oh. The user cancelled the Facebook login.")
                
                self.loginCancelledLabel.alpha = 1
                
            } else if user.isNew {
                NSLog("User signed up and logged in through Facebook!")
                
                self.performSegueWithIdentifier("signUp", sender: self)
                
                
            } else {
                NSLog("User logged in through Facebook!")
            }
        })
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if PFUser.currentUser() != nil {
            
            println("User logged in")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

