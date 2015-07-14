//
//  WriteReviewViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/9/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class WriteReviewViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var writeReview: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func nextButton(sender: UIButton) {
        
        RailsRequest.session().content = writeReview.text
        
        RailsRequest.session().createReviewWithCompletion { () -> Void in
            
            var submitVC = self.storyboard?.instantiateViewControllerWithIdentifier("submitVC")
            as! SubmitViewController
            
            submitVC.review = self.writeReview.text
            
            println("Write VC current nav stack: \(self.navigationController?.viewControllers)")
            
            self.navigationController?.pushViewController(submitVC, animated: true)
            
            
            
        }
        
    }
    
    @IBAction func takePic(sender: UIButton) {
        var cameraVC = self.storyboard?.instantiateViewControllerWithIdentifier("cameraVC")
            as! CameraViewController
        
//        self.presentViewController(cameraVC, animated: false, completion: nil)
        self.navigationController?.pushViewController(cameraVC, animated: true)
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
