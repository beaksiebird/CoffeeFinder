//
//  VenueViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/8/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit
import CoreLocation

class VenueViewController: UIViewController, UIImagePickerControllerDelegate {
    
    var venueInfo: [String:AnyObject]?
    var locationInfo: [String:AnyObject]?
    var venueHours: [String:AnyObject]?
    var venueID: String?
    var locationAddress: String?
    
    @IBAction func seePics(sender: UIButton) {

        var seeImagesVC = self.storyboard?.instantiateViewControllerWithIdentifier("seeImagesVC")
            as! ImageCollectionViewController
        
        seeImagesVC.venueID = self.venueID
        
        self.presentViewController(seeImagesVC, animated: false, completion: nil)
    }
    
    
    
    
    
    
    @IBAction func createReview(sender: UIButton) {
        
        var storyboard = UIStoryboard(name: "Review", bundle: nil)
        
        
        var reviewVC = storyboard.instantiateInitialViewController() as! UINavigationController
        
        self.presentViewController(reviewVC, animated: true, completion: nil)
        
    }
    
    @IBAction func reviewButton(sender: UIButton) {
        
        var reviewsTVC = self.storyboard?.instantiateViewControllerWithIdentifier("readreviewVC")
            as! ReviewsTableViewController
        
        reviewsTVC.venueID = venueID
        
        self.presentViewController(reviewsTVC, animated: false, completion: nil)
        
    }
    
    @IBAction func resultsButton(sender: UIButton) {
        
        var resultsVC = self.storyboard?.instantiateViewControllerWithIdentifier("resultsVC")
            as! ResultsViewController
        
        self.presentViewController(resultsVC, animated: false, completion: nil)
        
        
    }
    
    
    @IBOutlet weak var flagImage: UIButton!
    
    
        
    
    
    @IBOutlet weak var venueImage:
        UIImageView!
    
    
    let imagePicker = UIImagePickerController()
    
  
    
    
    @IBOutlet weak var nameInfo: UILabel!
    @IBOutlet weak var addressInfo: UILabel!
    @IBOutlet weak var hoursInfo: UILabel!
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        nameInfo.text = venueInfo?["name"] as? String
        venueID = venueInfo?["id"] as? String
        print("This is venueID \(venueID)")
        
        if let location = venueInfo?["location"] as? [String:AnyObject] {
            
            //println("This is the location: \(location)")
            
            let address = location["address"] as? String
            
            //println("This is the address: \(address)")
            addressInfo.text = address
            
            
            if let location = venueInfo?["location"] as? [String:AnyObject] {
                
                let city = location["city"] as? String
                
                hoursInfo.text = city
                
           
            
            
            }
            
            
        
        }
        
        
      
       
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    

}
