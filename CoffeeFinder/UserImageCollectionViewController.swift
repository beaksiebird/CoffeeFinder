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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    
        
        
        
        
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
        return 0
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 0
    }

    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UserImageCollectionViewCell {
        
        let userImages = reuseIdentifier2
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(userImages, forIndexPath: indexPath) as! UserImageCollectionViewCell
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
