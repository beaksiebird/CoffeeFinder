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
        

        dismissViewControllerAnimated(true, completion: nil)

    }
    
    override func viewDidLoad() {
       
    }
    
    

    func requestReviews() {
        
        
        let apiUrl = "https://api.foursquare.com/v2/"
        let foursquareId = "NEEAYQOQJE3WHXMGFYAPORCOB34JIWSIEVKBXIE3NUDDPBYU"
        let client_secret = "M2QIQDADDASWMBXX2GCR3WQZQA3IVBBNREEWEACRYKM3SJIP"
        let endpoint = apiUrl + "venues/\(venueID!)?client_id=\(foursquareId)&client_secret=\(client_secret)&v=20150101"
        
        
        
      
        
        if let url = NSURL(string: endpoint) {
            
            let request = NSURLRequest(URL: url)
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
                

                
                if let returnedInfo = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as? [String:AnyObject] {
                    
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


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete met
        // Return the number of rows in the section.
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reviewCell", forIndexPath: indexPath) as! ReviewTableViewCell
        
        cell.reviewTextView.text = items[indexPath.row]["text"] as? String
        
      return cell

   

}

}
