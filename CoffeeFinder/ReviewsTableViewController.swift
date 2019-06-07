//
//  ReviewsTableViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/13/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit
import CoreLocation

class ReviewsTableViewController: UITableViewController {
    
    var items: [[String:AnyObject]] = []
    var venueID: String? {
        
        didSet {
            
            if venueID != nil { requestReviews() }
            
        }
        
    }

    @IBAction func backButton(sender: UIButton) {

        dismiss(animated: true, completion: nil)

    }

    func requestReviews() {
        
        let apiUrl = "https://api.foursquare.com/v2/"
        let foursquareId = "NEEAYQOQJE3WHXMGFYAPORCOB34JIWSIEVKBXIE3NUDDPBYU"
        let client_secret = "M2QIQDADDASWMBXX2GCR3WQZQA3IVBBNREEWEACRYKM3SJIP"
        let endpoint = apiUrl + "venues/\(venueID!)?client_id=\(foursquareId)&client_secret=\(client_secret)&v=20150101"
        
    
        if let url = NSURL(string: endpoint) {
            
            let request = NSURLRequest(url: url as URL)
            
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main, completionHandler: { (response, data, error) -> Void in
                
                if let returnedInfo = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:AnyObject] {
                    
                    self.items = []
                    
                    if let responseInfo = returnedInfo["response"] as? [String:AnyObject] {

                        if let venueInfo = responseInfo["venue"] as? [String:AnyObject] {
                            

                            if let tips = venueInfo["tips"] as? [String:AnyObject] {
                                
                             
                                
                                if let groups = tips["groups"] as? [[String:AnyObject]] {
                                    
                                    for group in groups {
                                        
                                        
                                        if let items = group["items"] as? [[String:AnyObject]] {
                                            
                                            self.items += items
                                            self.tableView.reloadData()
                                            
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


    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath as IndexPath) as! ReviewTableViewCell
        
        cell.reviewTextView.text = items[indexPath.row]["text"] as? String
        
        return cell
        
        
        
    }
    
}
