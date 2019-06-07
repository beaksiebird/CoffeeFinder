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
    
    var venuePackagedInfo: [String:AnyObject] = [:]
    var venueInfo: [String:AnyObject]?
    var locationInfo: [String:AnyObject]?
    var venueHours: [String:AnyObject]?
    var venueID: String?
    var locationAddress: String?
    
    @IBAction func seePics(sender: UIButton) {
        
        let seeImagesVC = self.storyboard?.instantiateViewController(withIdentifier: "seeImagesVC")
            as! ImageCollectionViewController
        
        seeImagesVC.venueID = self.venueID
        
        self.present(seeImagesVC, animated: false, completion: nil)
    }
    
    
    @IBAction func reviewButton(sender: UIButton) {
        
        let reviewsTVC = self.storyboard?.instantiateViewController(withIdentifier: "readreviewVC")
            as! ReviewsTableViewController
        
        reviewsTVC.venueID = venueID
        
        self.present(reviewsTVC, animated: false, completion: nil)
        
    }
    
    @IBAction func resultsButton(sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
//
//        let resultsVC = self.storyboard?.instantiateViewController(withIdentifier: "resultsVC")
//            as! ResultsViewController
//
//        self.present(resultsVC, animated: false, completion: nil)
//
        
    }
    
    
    
    @IBOutlet weak var venueImage:
    UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var nameInfo: UILabel!
    @IBOutlet weak var addressInfo: UILabel!
    @IBOutlet weak var hoursInfo: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameInfo.text = venueInfo?["name"] as? String
        venuePackagedInfo["name"] = venueInfo?["name"]
        
        venueID = venueInfo?["id"] as? String
        
        
        if let location = venueInfo?["location"] as? [String:AnyObject] {
            
            let address = location["address"] as? String
 
            addressInfo.text = address
            venuePackagedInfo["address"] = address as AnyObject?
            venuePackagedInfo["state"] = location["state"] as? String as AnyObject?
            venuePackagedInfo["zip_code"] = location["postalCode"] as? String as AnyObject?
            
            if let location = venueInfo?["location"] as? [String:AnyObject] {
                
                let city = location["city"] as? String
                
                hoursInfo.text = city
                venuePackagedInfo["city"] = city as AnyObject?
                
                
                
                
            }
            
            
            
        }
        
        
        
    }
    
    
}
