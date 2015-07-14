//
//  SubmitViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/9/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class SubmitViewController: UIViewController, UIImagePickerControllerDelegate  {
    
    
    
    @IBOutlet weak var userReview: UITextView!
    @IBOutlet weak var userImage: UIImageView!
    
    var image: UIImage!
    var review: String!
    
    
    @IBAction func editReview(sender: UIButton) {
        
        
        var writereviewVC = self.storyboard?.instantiateViewControllerWithIdentifier("writereviewVC")
            as! WriteReviewViewController
        
        self.navigationController?.pushViewController(writereviewVC, animated: true)
        
        }
    
    

    
    @IBAction func editPic(sender: UIButton) {
        
        
        var cameraVC = self.storyboard?.instantiateViewControllerWithIdentifier("cameraVC")
            as! CameraViewController
        
        self.navigationController?.pushViewController(cameraVC, animated: true)
        
        }
    

    
    @IBAction func createReview(sender: AnyObject) {
        
        
        RailsRequest.session().content = userReview.text
       //RailsRequest.session().imageURL = userImage
            
        RailsRequest.session().createReviewWithCompletion { () -> Void in
        
        
    
    }
    
    
        
    
        
        
        
        var venueVC = self.storyboard?.instantiateViewControllerWithIdentifier("venueVC")
            as! ResultsViewController
        
        self.presentViewController(venueVC, animated: false, completion: nil)
        
        }
        
    
    
//ASK JO

    override func viewDidLoad() {
        super.viewDidLoad()

        userImage.image = image
        userReview.text = review
        
      //  let imageData = NSData(contentsOfURL: )
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
