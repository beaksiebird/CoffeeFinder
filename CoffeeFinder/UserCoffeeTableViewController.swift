//
//  UserCoffeeTableViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/17/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit
import CoreLocation

class UserCoffeeTableViewController: UITableViewController {
    
    
    @IBAction func reportReview(sender: UIButton) {
        
        
        
        RailsRequest.session().flagReviewWithCompletion { () -> Void in
            
            
            
        }
        
        
        
    }
    
    
    
    @IBAction func backButton(sender: UIButton) {
        
        
        
        var uservenueVC = storyboard?.instantiateViewControllerWithIdentifier("uservenueVC")
            as! UserVenueViewController
        
        self.presentViewController(uservenueVC, animated: false, completion: nil)
        
        
    }
    
    
    
    var items: [[String:AnyObject]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        RailsRequest.session().getAvailableReviewsWithCompletion { (reviews) -> Void in
            
        
            
            self.items = reviews
            self.tableView.reloadData()
        }
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

 

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("userReviewCell", forIndexPath: indexPath) as! UserCoffeeTableViewCell
        


      cell.userReviews.text = items[indexPath.row]["content"] as? String
        
        
        
        return cell
    }
    

  
}
