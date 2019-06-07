//
//  RailsRequest.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/2/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import Foundation
private let defaults = UserDefaults.standard
private let _singleton = RailsRequest()

let API_URL = "https://pacific-atoll-5255.herokuapp.com/"


class RailsRequest: NSObject {
    
    class func session() -> RailsRequest { return _singleton }
    
    var token: String? {
        
        get {
            
            return defaults.object(forKey: "TOKEN") as? String
            
        }
        
        set {
            
            defaults.setValue(newValue, forKey: "TOKEN")
            defaults.synchronize()
            
        }
    }

    var password: String?
    var imageURL: UIImage?
    var content: String?
    var review_id: Int?
    var establishment_id: Int?
    var name: String?
    var street_address: String?
    var city: String?
    var state: String?
    var zip_code: Int?
    var flagged: Bool?
    var coffee_quality = 0
    var price = 0
    var ambiance = 0
    var wifi = 0
    
    
    
    func searchEstablishmentsWithCompletion(completion: @escaping () -> Void) {
        
        let info = [
        
            "method" : "GET",
            "endpoint" : "establishments/search?price=&coffee_quality=&price=&ambiance=&wifi=",

            
            ] as [String:AnyObject]
        
        requestWithInfo(info: info, andCompletion: { (responseInfo) -> Void in
        
            print(responseInfo as Any)
            
            if let name = responseInfo?["name"] as? String {
                
                self.name = name
                
                print(name)
            }
            
            if let streetaddress = responseInfo?["street_address"] as? String {
                
                self.street_address = streetaddress
            }
            
            if let city = responseInfo?["city"] as? String {
                
                self.city = city 
            }
            
            completion()
            
        })
        
    }
    
   

    
    func getAvailableReviewsWithCompletion(completion: @escaping (_ reviews: [[String:AnyObject]]) -> Void) {
        
        let info = [
            
            "method" : "GET",
            "endpoint" : "reviews/available"
            
            ] as [String:AnyObject]
        
        requestWithInfo(info: info, andCompletion: { (responseInfo) -> Void in
        
            print("This is for the responseInfo in get request \(String(describing: responseInfo))")

            if let reviews = responseInfo as? [[String:AnyObject]] {
                
                print("This is for the responseInfo in get request \(String(describing: responseInfo))")
                completion(reviews)
                
            }
            
        })
                
    }
    
    

    
    
    func getEstablishmentWithCompletion(completion: @escaping () -> Void) {
        
        let info = [
            
            "method" : "GET",
            "endpoint" : "establishment/\(establishment_id!)",
            "parameters" : [
                
                "establishment_id" : establishment_id!,
            
                ]
            
            ] as [String:AnyObject]
        
        requestWithInfo(info: info, andCompletion: { (responseInfo) -> Void in
    
            
            if let accessToken = responseInfo?["access_token"] as? String {
                
                self.token = accessToken
                
                completion()
               
                
            }
            
        })
        
        completion()
        
    }
    
    
    
    
    
    func getReviewWithCompletion(completion: @escaping () -> Void) {
        
        let info = [
            
            "method" : "GET",
            "endpoint" : "review/\(review_id!)",
            "parameters" : [
                
                "review_id" : "\(review_id!)",
              
                ]
            
            ] as [String:AnyObject]
        
        requestWithInfo(info: info, andCompletion: { (responseInfo) -> Void in
            
            print(responseInfo!)
            
            if let accessToken = responseInfo?["access_token"] as? String {
                
                self.token = accessToken
                
                completion()
              
                
            }
            
        })
        
        completion()
        
    }

    
    
    func requestWithInfo(info: [String:AnyObject], andCompletion completion: ((_ responseInfo: AnyObject?) -> Void)?) {
        
        let endpoint = info["endpoint"] as! String
        
        if let url = NSURL(string: API_URL + endpoint) {
            
            let request = NSMutableURLRequest(url: url as URL)
            
            request.httpMethod = info["method"] as! String
            
            if let token = token {
                
                request.setValue(token, forHTTPHeaderField: "Access-Token")
                
            }
            
            if let bodyInfo = info["parameters"] as? [String:AnyObject] {
                
                let requestData = try! JSONSerialization.data(withJSONObject: bodyInfo, options: JSONSerialization.WritingOptions.prettyPrinted)
                
                
                let jsonString = NSString(data: requestData, encoding: String.Encoding.utf8.rawValue)
                
                let postLength = "\(jsonString!.length)"
                
                request.setValue(postLength, forHTTPHeaderField: "Content-Length")

                //let postData = jsonString?.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: true)
                let postData = jsonString?.data(using: String.Encoding.ascii.rawValue, allowLossyConversion: true)
            
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
                request.httpBody = postData
                
            }
            
            
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main, completionHandler: { (response, data, error) -> Void in
                
                print(data!)
                
                if data != nil {
                    
                    if let json: AnyObject = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject {
                        
                        completion?(json)
                        
                    }
                    
                }
                
            })
            
        }
        
    }
    
}

