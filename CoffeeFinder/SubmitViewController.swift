//
//  SubmitViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/9/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class SubmitViewController: UIViewController {
    
    
    @IBAction func submitReview(sender: UIButton) {
        var venueVC = self.storyboard?.instantiateViewControllerWithIdentifier("venueVC")
            as! ResultsViewController
        
        self.presentViewController(venueVC, animated: false, completion: nil)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
