//
//  ImageCollectionViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/15/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit
import CoreLocation



class ImageCollectionViewController: UICollectionViewController {
    
   
    @IBAction func backButton(sender: UIButton) {
        
        self.dismiss(animated: false, completion: nil)
    }
    
    var urlArray: NSMutableArray = []
    var venueID : String?
    let reuseIdentifier = "establishmentImages"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if venueID != nil {
            requestImages()
        }
        
        self.collectionView!.register(ImageCollectionViewCell.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: "establishmentImages")
    }

    
    func requestImages() {
    
        let apiUrl = "https://api.foursquare.com/v2/"
        let foursquareId = "NEEAYQOQJE3WHXMGFYAPORCOB34JIWSIEVKBXIE3NUDDPBYU"
        let client_secret = "M2QIQDADDASWMBXX2GCR3WQZQA3IVBBNREEWEACRYKM3SJIP"

        print(venueID!)
        
        let endpoint = apiUrl + "venues/\(venueID!)?client_id=\(foursquareId)&client_secret=\(client_secret)&v=20150101"
        
        print(endpoint)
        
        if let url = NSURL(string: endpoint) {
            
            let request = NSURLRequest(url: url as URL)
            
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main, completionHandler: { (response, data, error) -> Void in
                
                print("response: \(String(describing: response))")
                
                if let returnedInfo = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:AnyObject] {
                    
                    print("returned info: \(returnedInfo)")
                    
                    if let responseInfo = returnedInfo["response"] as? [String:AnyObject] {
                        
                        if let venueInfo = responseInfo["venue"] as? [String:AnyObject] {
                            
                            if let photosInfo = venueInfo["photos"] as? [String:AnyObject] {
                                
                                print("photos info: \(photosInfo)")
                                
                                if let groupsInfo = photosInfo["groups"] as? [AnyObject] {
                                    
                                    if groupsInfo.count > 0 {
                                        
                                        print("groups info: \(groupsInfo[0])")
                                        
                                        if let itemsInfo = groupsInfo[0]["items"] as? [AnyObject] {
                                            
                                            print("items info: \(itemsInfo)")
                                            
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
                                                
                                                
                                                print(urlString)
                                                self.urlArray.add(urlString)
                                                print(self.urlArray.count)
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
    
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }


        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return urlArray.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> ImageCollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "establishmentImages", for: indexPath as IndexPath) as! ImageCollectionViewCell

        let url = NSURL(string: urlArray[indexPath.row] as! String)
        
       
        let data = NSData(contentsOf: url! as URL)
        let image = UIImage(data: data! as Data)
        
        
        cell.image.image = image
    
      
        return cell
    }

    

}
