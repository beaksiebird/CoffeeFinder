//
//  VenueViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/8/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class VenueViewController: UIViewController {
    
    
    @IBAction func reviewButton(sender: UIButton) {
        
        var reviewVC = self.storyboard?.instantiateViewControllerWithIdentifier("reviewVC")
            as! ReviewViewController
        
        self.presentViewController(reviewVC, animated: false, completion: nil)
        
    }
    
    @IBAction func resultsButton(sender: UIButton) {
        
        var resultsVC = self.storyboard?.instantiateViewControllerWithIdentifier("resultsVC")
            as! ResultsViewController
        
        self.presentViewController(resultsVC, animated: false, completion: nil)
        
        
    }
    
    
    
    
    
    @IBOutlet weak var venueImage: UIImageView!
    @IBOutlet weak var addressInfo: UILabel!
    @IBOutlet weak var checkinsInfo: UILabel!
    @IBOutlet weak var herenowInfo: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    

}
