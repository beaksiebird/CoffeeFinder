//
//  UserImageCollectionViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/18/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

let reuseIdentifier2 = "userImages"

class UserImageCollectionViewController: UICollectionViewController {
    
    
    
    
    @IBAction func backButton(sender: UIButton) {
        
        var uservenueVC = storyboard?.instantiateViewControllerWithIdentifier("uservenueVC")
            as! UserVenueViewController
        
        self.presentViewController(uservenueVC, animated: false, completion: nil)
        
        
        
    }
    
    
    
    
    
    
    var images: [[String:AnyObject]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        RailsRequest.session().getAvailableReviewsWithCompletion { (images) -> Void in
            
            self.images = images
            self.collectionView?.reloadData()
       
        }
        
        
  
       
        
        self.collectionView!.registerClass(UserImageCollectionViewCell.self,
            forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: "userImages")
        }

    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return images.count
        
    }

    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UserImageCollectionViewCell {
        
        let userImages = reuseIdentifier2
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(userImages, forIndexPath: indexPath) as! UserImageCollectionViewCell
        
        let availableReview = images[indexPath.row]
        let imageUrlString = availableReview["image_url"] as? String
        
        let url = NSURL(string: imageUrlString!)
        let data = NSData(contentsOfURL: url!)
        let image = UIImage(data: data!)
        
        cell.userReviewImage.image = image
    
        return cell
    }


}
