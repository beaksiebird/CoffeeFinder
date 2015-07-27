//
//  SubmitViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/9/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class SubmitViewController: UIViewController, UIImagePickerControllerDelegate, UITextViewDelegate {
    
    
    
    @IBOutlet weak var userReview: UITextView!
    @IBOutlet weak var userImage: UIImageView!
    
    var imageURL: UIImage!
    var review: String!
    
    
    @IBAction func editReview(sender: UIButton) {
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        }
    
    

    
    @IBAction func editPic(sender: UIButton) {
        
        
      self.dismissViewControllerAnimated(true, completion: nil)
        
        }
    

    
    @IBAction func createReview(sender: AnyObject) {
        
        
        RailsRequest.session().content = userReview.text
    
        RailsRequest.session().imageURL = userImage.image
            
       
        
        RailsRequest.session().createReviewWithCompletion({ () -> Void in
        
        })
        
        
    
        self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    
    

    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        
        userImage.image = imageURL
        userReview.text = review
        
    }

    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"
        {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
