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
    
    
    
    @IBAction func nextButton(sender: UIButton) {
        
        RailsRequest.session().content = writeReview.text
        
        RailsRequest.session().createReviewWithCompletion { () -> Void in
            
            var submitVC = self.storyboard?.instantiateViewControllerWithIdentifier("submitVC")
            as! SubmitViewController
            
            submitVC.review = self.writeReview.text
            
            self.navigationController?.pushViewController(submitVC, animated: true)
            
            
            
        }
        
    }
    
    @IBAction func takePic(sender: UIButton) {
        var cameraVC = self.storyboard?.instantiateViewControllerWithIdentifier("cameraVC")
            as! CameraViewController
        
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
