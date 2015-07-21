//
//  ViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/2/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
         func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
            self.view.endEditing(true)
        }
    }
    
    
    @IBAction func newRegister(sender: UIButton) {
    
    }

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginButton(sender: UIButton) {
        
        RailsRequest.session().username = usernameField.text
        RailsRequest.session().password = passwordField.text
        
        RailsRequest.session().loginWithCompletion { () -> Void in
            
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            
            var mainNVC = storyboard.instantiateInitialViewController() as! UINavigationController
           
            self.presentViewController(mainNVC, animated: true, completion: nil)
        }
    
    }
 

}