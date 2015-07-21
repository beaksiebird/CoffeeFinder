//
//  RegisterViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/2/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    
    @IBAction func backButton(sender: UIButton) {
        
        var loginVC = self.storyboard?.instantiateViewControllerWithIdentifier("loginVC")
            as! ViewController
        
        self.presentViewController(loginVC, animated: false, completion: nil)
    }
   
    
    @IBOutlet weak var usernameOutlet: UITextField!
    
    
    @IBOutlet weak var emailOutlet: UITextField!
    
    @IBOutlet weak var passwordOulet: UITextField!
    
    @IBAction func submitButton(sender: UIButton) {
        
        RailsRequest.session().username = usernameOutlet.text
        RailsRequest.session().password = passwordOulet.text
        RailsRequest.session().email = emailOutlet.text
        RailsRequest.session().registerWithCompletion { () -> Void in
            
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            
            var mainNVC = storyboard.instantiateInitialViewController() as! UINavigationController
            
            self.presentViewController(mainNVC, animated: true, completion: nil)
       
        }
    
    }

}
