//
//  UserVenueViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/19/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class UserVenueViewController: UIViewController {
    
    var ourvenueInfo:[String:AnyObject]?
    var ourusernameInfo: String?
    var ouruseraddressInfo: String?
    var ourusercityInfo: String?
    
    @IBAction func createuserReview(sender: UIButton) {
        
        var storyboard = UIStoryboard(name: "Review", bundle: nil)
        
        var reviewNVC = storyboard.instantiateInitialViewController() as! UINavigationController
        
        let reviewVC = reviewNVC.viewControllers[0] as! RatingsViewController
        
       //reviewVC.venuePackagedInfo = ourvenueInfo!
        
        self.presentViewController(reviewNVC, animated: false, completion: nil)
        
    }
    
  
    @IBAction func picsButton(sender: UIButton) {
        
        
        var userImageVC = self.storyboard?.instantiateViewControllerWithIdentifier("userImageVC")
            as! UserImageCollectionViewController
        
        self.presentViewController(userImageVC, animated: false, completion: nil)
        
    }
    
    
    
    @IBAction func readButton(sender: UIButton) {
        
        
        var userreviewVC = self.storyboard?.instantiateViewControllerWithIdentifier("userreviewVC")
            as! UserCoffeeTableViewController
        
        self.presentViewController(userreviewVC, animated: false, completion: nil)
        
        
    }
    
    
    @IBAction func backButton(sender: UIButton) {
        
        
        var homeVC = self.storyboard?.instantiateViewControllerWithIdentifier("homeVC")
            as! HomeViewController
        
        self.presentViewController(homeVC, animated: false, completion: nil)
    }
    
    
    @IBOutlet weak var usernameInfo: UILabel!
    
    @IBOutlet weak var useraddressInfo: UILabel!
    
    @IBOutlet weak var usercityInfo: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameInfo.text = RailsRequest.session().name
        
        println(RailsRequest.session().name)
    
        useraddressInfo.text = RailsRequest.session().street_address
        
        println(RailsRequest.session().street_address)
        
        usercityInfo.text = RailsRequest.session().city
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
