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
    
   
    @IBAction func backButton(sender: UIButton) {
        
        self.dismissViewControllerAnimated(false, completion: nil)        
    }
    
    
    var urlArray: NSMutableArray = []
    var venueID : String? {
    
    didSet {
    
        if venueID != nil { requestImages() }
       
        }
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        self.collectionView!.registerClass(ImageCollectionViewCell.self,
            forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: "establishmentImages")


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
                
                    println("response: \(response)")
                
                if let returnedInfo = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as? [String:AnyObject] {
                    
                    println("returned info: \(returnedInfo)")
                    
                    if let responseInfo = returnedInfo["response"] as? [String:AnyObject] {
                        
                        if let venueInfo = responseInfo["venue"] as? [String:AnyObject] {
                            
                            if let photosInfo = venueInfo["photos"] as? [String:AnyObject] {
                                
                                println("photos info: \(photosInfo)")
                                
                                if let groupsInfo = photosInfo["groups"] as? [AnyObject] {
                                    
                                    if groupsInfo.count > 0 {
                                        
                                        println("groups info: \(groupsInfo[0])")
                                        
                                        if let itemsInfo = groupsInfo[0]["items"] as? [AnyObject] {
                                            
                                            println("items info: \(itemsInfo)")
                                            
                                            for item in itemsInfo {
                                                
                                                var urlString = String()
                                                
                                                let prefix = item["prefix"] as? String
                                                urlString += prefix!
                                                
                                                
                                                let width = item["width"] as? Int
                                                urlString += String(width!)
                                                
                                                urlString += "x"
                                                
                                                let height = item["height"] as? Int
                                                urlString += String(height!)
                                                
                                                
                                                let suffix = item["suffix"] as? String
                                                urlString += suffix!
                                                
                                                
                                                println(urlString)
                                                self.urlArray.addObject(urlString)
                                                println(self.urlArray.count)
                                                self.collectionView!.reloadData()
                                            }
                                            
                                        }

                                        
                                    }
                                    
                                    
                                }

                                
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
        return urlArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> ImageCollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("establishmentImages", forIndexPath: indexPath) as! ImageCollectionViewCell

    
        
        let url = NSURL(string: urlArray[indexPath.row] as! String)
        
        println(url)
        let data = NSData(contentsOfURL: url!)
        let image = UIImage(data: data!)
        
        
        cell.image.image = image
    
      
        return cell
    }

  

}
