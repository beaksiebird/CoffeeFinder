//
//  ReviewViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/2/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    
    
    
    
    
    
    @IBAction func submitReview(sender: UIButton) {
    }
    
    
    
    @IBAction func takePic(sender: UIButton) {
        
        var cameraVC = self.storyboard?.instantiateViewControllerWithIdentifier("cameraVC")
            as! CameraViewController
        
        self.presentViewController(cameraVC, animated: false, completion: nil)
        
    }
    
    
    
    
    @IBAction func homeButton(sender: UIButton) {
        
        var homeVC = self.storyboard?.instantiateViewControllerWithIdentifier("homeVC")
            as! HomeViewController
        
        self.presentViewController(homeVC, animated: false, completion: nil)
        
        }
    
    
    
    
    @IBAction func backButton(sender: UIButton) {
        
        var resultsVC = self.storyboard?.instantiateViewControllerWithIdentifier("resultsVC")
            as! ResultsViewController
        
        self.presentViewController(resultsVC, animated: false, completion: nil)
        
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
