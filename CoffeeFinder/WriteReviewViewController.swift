//
//  WriteReviewViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/9/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class WriteReviewViewController: UIViewController {
    
    
    @IBOutlet weak var writeReview: UITextView!
    
    
    
    @IBAction func submitButton(sender: UIButton) {
        
    }
    
    @IBAction func takePic(sender: UIButton) {
        var cameraVC = self.storyboard?.instantiateViewControllerWithIdentifier("cameraVC")
            as! ResultsViewController
        
        self.presentViewController(cameraVC, animated: false, completion: nil)
        
        
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
