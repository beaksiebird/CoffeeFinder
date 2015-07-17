//
//  SearchViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/9/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    @IBAction func deleteAccount(sender: UIButton) {
        
        
        RailsRequest.session().deleteUserWithCompletion { () -> Void in
            
            }
        
        //var loginVC = self.storyboard?.instantiateViewControllerWithIdentifier("loginVC")
        //    as! WriteReviewViewController
        
        //self.navigationController?.pushViewController(loginVC, animated: false)
        
        
    }
    
    
    
    @IBAction func searchReviewed(sender: UIButton) {
        
            
        
        var homeVC = self.storyboard?.instantiateViewControllerWithIdentifier("homeVC")
            as! HomeViewController
        
        self.presentViewController(homeVC, animated: false, completion: nil)
        
        }
    
    
    
    @IBAction func searchCoffee(sender: UIButton) {
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if RailsRequest.session().token == nil {
            
            let loginSB = UIStoryboard(name: "Login", bundle: nil)
            
            let loginVC = loginSB.instantiateInitialViewController() as! ViewController
            
            presentViewController(loginVC, animated: false, completion: nil)

            
        }
        
        
        // present loginVC
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
