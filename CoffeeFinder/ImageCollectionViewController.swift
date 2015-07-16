//
//  ImageCollectionViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/15/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit
import CoreLocation




let reuseIdentifier = "establishmentImages"

class ImageCollectionViewController: UICollectionViewController {
    
    
    
    
    var items : [[String:AnyObject]] = []
    var venueID : String? {
    
    didSet {
    
        if venueID != nil { requestImages() }
       
        }
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "establishmentImages")


    }

    
    func requestImages() {
        
        let apiUrl = "https://api.foursquare.com/v2/"
        let foursquareId = "NEEAYQOQJE3WHXMGFYAPORCOB34JIWSIEVKBXIE3NUDDPBYU"
        let client_secret = "M2QIQDADDASWMBXX2GCR3WQZQA3IVBBNREEWEACRYKM3SJIP"

        println(venueID)
        
        let endpoint = apiUrl + "venues/\(venueID!)?client_id=\(foursquareId)&client_secret=\(client_secret)&v=20150101"
        
        println(endpoint)
        
        if let url = NSURL(string: endpoint) {
            
            let request = NSURLRequest(URL: url)
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
                
                                println(response)
                
                if let returnedInfo = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as? [String:AnyObject] {
                    
                    self.items = []
                    
                                       println(returnedInfo)
                    
                    if let responseInfo = returnedInfo["response"] as? [String:AnyObject] {
                                              println(responseInfo)
                        
                        if let photosInfo = responseInfo["photos"] as? [String:AnyObject] {
                            
                                println(photosInfo)
                                        
                                        if let items = photosInfo["items"] as? [[String:AnyObject]] {
                                            
                            
                                            
                                            self.items += items
                                            self.collectionView!.reloadData()
                                            
                            }

                            
                        }
                        
                    }
                    
                }
                
                
            })
            
            
        }
        
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
        return items.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("establishmentImages", forIndexPath: indexPath) as! UICollectionViewCell
    
        
      
        return cell
    }

  

}
