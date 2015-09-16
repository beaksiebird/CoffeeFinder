//
//  RatingsViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/9/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class RatingsViewController: UIViewController {
    
    var venuePackagedInfo: [String:AnyObject] = [:]
    
    @IBOutlet weak var coffeeSegControl: UISegmentedControl!
    @IBOutlet weak var wifiSegControl: UISegmentedControl!
    @IBOutlet weak var priceSegControl: UISegmentedControl!
    @IBOutlet weak var ambianceSegControl: UISegmentedControl!
    
    @IBAction func nextButton(sender: UIButton) {
        
        venuePackagedInfo["coffee_quality"] = coffeeSegControl.selectedSegmentIndex + 1 as Int
        venuePackagedInfo["price"] = priceSegControl.selectedSegmentIndex + 1 as Int
        venuePackagedInfo["ambiance"] = ambianceSegControl.selectedSegmentIndex + 1 as Int
        venuePackagedInfo["wifi"] = wifiSegControl.selectedSegmentIndex + 1 as Int
        
        println(venuePackagedInfo)
        
        RailsRequest.session().createnewEstablishmentWithCompletion(venuePackagedInfo, completion: { () -> Void in
            
            println(self.venuePackagedInfo)
            
            var writereviewVC = self.storyboard?.instantiateViewControllerWithIdentifier("writereviewVC")
                as! WriteReviewViewController
            
            self.navigationController?.pushViewController(writereviewVC, animated: false)
            
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coffeeSegControl.selectedSegmentIndex = 0
        priceSegControl.selectedSegmentIndex = 0
        ambianceSegControl.selectedSegmentIndex = 0
        wifiSegControl.selectedSegmentIndex = 0
        
        println("Ratings VC view did load: \(venuePackagedInfo)")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
