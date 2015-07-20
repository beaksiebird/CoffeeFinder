//
//  RailsRequest.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/2/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import Foundation
private let defaults = NSUserDefaults.standardUserDefaults()
private let _singleton = RailsRequest()

let API_URL = "https://pacific-atoll-5255.herokuapp.com/"


class RailsRequest: NSObject {
    
    class func session() -> RailsRequest { return _singleton }
    
    var token: String? {
        
        get {
            
            return defaults.objectForKey("TOKEN") as? String
            
        }
        
        set {
            
            defaults.setValue(newValue, forKey: "TOKEN")
            defaults.synchronize()
            
        }
    }
   
    var setUsername: String? {
        
        get {
            
            return defaults.objectForKey("USER") as? String
        }
        set {
            
            defaults.setValue(newValue, forKey: "USER")
            defaults.synchronize()
        }
    }
    
    var username: String?
    var email: String?
    var password: String?
    var imageURL: UIImage?
    var content: String?
    var review_id: Int?
    var user_id: Int?
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
    
    
    
    func searchEstablishmentsWithCompletion(completion: () -> Void) {
        
        var info = [
        
            "method" : "GET",
            "endpoint" : "establishments/search?price=&coffee_quality=&price=&ambiance=&wifi=&page=1&per=1",

            
            ] as [String:AnyObject]
        
        requestWithInfo(info, andCompletion: { (responseInfo) -> Void in
        
            println(responseInfo)
            
            if let name = responseInfo?[0]["name"] as? String {
                
                self.name = name
                
                println(name)
            }
            
            if let streetaddress = responseInfo?[0]["street_address"] as? String {
                
                self.street_address = streetaddress
            }
            
            if let city = responseInfo?[0]["city"] as? String {
                
                self.city = city 
            }
            
            completion()
            
        })
        
    }
    
   
    
    func createnewEstablishmentWithCompletion(venuePackagedInfo: [String:AnyObject], completion: () -> Void) {
        
        var name = venuePackagedInfo["name"] as? String
        var address = venuePackagedInfo["address"] as? String
        var city = venuePackagedInfo["city"] as? String
        var state = venuePackagedInfo["state"] as? String
        
        var zipCode = venuePackagedInfo["zip_code"] as? String
        var intZipCode = zipCode?.toInt()
        var coffeeQuality = venuePackagedInfo["coffee_quality"] as? Int
        var price = venuePackagedInfo["price"] as? Int
        var ambiance = venuePackagedInfo["ambiance"] as? Int
        var wifi = venuePackagedInfo["wifi"] as? Int
        
        println(zipCode)
        

        var info = [
            
            "method" : "POST",
            "endpoint" : "establishments/new",
            "parameters" : [
                
                "name" : name!,
                "street_address" : address!,
                "city" : city!,
                "state" : state!,
                "zip_code" : intZipCode!,
                "coffee_quality" : coffeeQuality!,
                "price": price!,
                "ambiance" : ambiance!,
                "wifi" : wifi!,
                ]
            
            ] as [String:AnyObject]
        
        println("create new establishment rails request info:\n \(info)")
        
        requestWithInfo(info, andCompletion: { (responseInfo) -> Void in
            
            println(responseInfo)
            
            if let accessToken = responseInfo?["access_token"] as? String {
                
                self.token = accessToken
                
                completion()
                //end repeated stuff
                
            }
            
        })
        
        completion()
        
    }
    
    
    
    
    
    
    
    
    func getEstablishmentWithCompletion(completion: () -> Void) {
        
        var info = [
            
            "method" : "GET",
            "endpoint" : "establishment/\(establishment_id!)",
            "parameters" : [
                
                "establishment_id" : establishment_id!,
            
                ]
            
            ] as [String:AnyObject]
        
        requestWithInfo(info, andCompletion: { (responseInfo) -> Void in
            
            println(responseInfo)
            
            if let accessToken = responseInfo?["access_token"] as? String {
                
                self.token = accessToken
                
                completion()
               
                
            }
            
        })
        
        completion()
        
    }
    
    
    
    
    
    func getReviewWithCompletion(completion: () -> Void) {
        
        var info = [
            
            "method" : "GET",
            "endpoint" : "review/\(review_id!)",
            "parameters" : [
                
                "review_id" : "\(review_id!)",
              
                ]
            
            ] as [String:AnyObject]
        
        requestWithInfo(info, andCompletion: { (responseInfo) -> Void in
            
            println(responseInfo)
            
            if let accessToken = responseInfo?["access_token"] as? String {
                
                self.token = accessToken
                
                completion()
                //end repeated stuff
                
            }
            
        })
        
        completion()
        
    }
    
    
    func registerWithCompletion(completion: () -> Void) {
        
        var info = [
            
            "method" : "POST",
            "endpoint" : "users/signup",
            "parameters" : [
                
                "username" : username!,
                "email" : email!,
                "password" : password!,
             
                
            ]
            
            ] as [String:AnyObject]
        
        requestWithInfo(info, andCompletion: { (responseInfo) -> Void in
            
            println(responseInfo)
            
            if let accessToken = responseInfo?["access_token"] as? String {
                
                self.token = accessToken
                
                completion()
                //end repeated stuff
            }
            
        })
        
        completion()
        
    }
    
    func loginWithCompletion(completion: () -> Void) {
        
        
        var info = [
            
            "method" : "POST",
            "endpoint" : "users/login",
            "parameters" : [
                
                "username" : username!,
                "password" : password!
                
            ]
            ] as [String:AnyObject]
        
        requestWithInfo(info, andCompletion: { (responseInfo) -> Void in
            
            println(responseInfo)
            
            if let user = responseInfo?["user"] as? [String:AnyObject] {
                
                if let accessToken = user["access_token"] as? String {
                    
                    self.token = accessToken
                    
                    completion()
                    
                }
                
                self.username = user["username"] as? String
                
            }
            
        })
        
    }

    func createReviewWithCompletion(completion: () -> Void) {
        
        
        var info = [
            
            "method" : "POST",
            "endpoint" : "reviews/new",
            "parameters" : [
                
                
                "user_id" : "user_id",
                "establishment_id" : "establishment_id!",
                "image" : "https: //coffeecollection.s3.amazonaws.com/myImage_1435934260.png",
                "content" : "content"
                
            ]
            ] as [String:AnyObject]
        
        requestWithInfo(info, andCompletion: { (responseInfo) -> Void in
            
            println(responseInfo)
            
            completion()
            
        })
        
    }
    
    
    func flagReviewWithCompletion(completion: () -> Void) {
        
        
        var info = [
            
            "method" : "PATCH",
            "endpoint" : "/review/\(review_id!)",
            "parameters" : [
                
                "content" : "content!",
                "flagged" : "flagged!",
                "imageURL" : "imageURL",
                
                
                
                
            ]
            ] as [String:AnyObject]
        
        requestWithInfo(info, andCompletion: { (responseInfo) -> Void in
            
            println(responseInfo)
            
            if let accessToken = responseInfo?["access_token"] as? String {
                
                self.token = accessToken
                
                completion()
                
            }
            
        })
        
        completion()
        
    }
    
    
    
    func deleteReviewWithCompletion(completion: () -> Void) {
        
        
        var info = [
            
            "method" : "DELETE",
            "endpoint" : "review/\(review_id!)",
            "parameters" : [
                
                "reviewid" : review_id!,
                
                
            ]
            ] as [String:AnyObject]
        
        requestWithInfo(info, andCompletion: { (responseInfo) -> Void in
            
            println(responseInfo)
            
            if let accessToken = responseInfo?["access_token"] as? String {
                
                self.token = accessToken
                
                completion()
                
            }
            
        })
        
        completion()
        
    }
    

    func deleteUserWithCompletion(completion: () -> Void) {
        
        
        var info = [
            
            "method" : "DELETE",
            "endpoint" : "user/delete/\(username!)",
//            "parameters" : [
//                
//                "username" : "\(username!)",
//                
//                
//            ]
           
            ] as [String:AnyObject]
        
        println("This is the railsrequest username \(username)")
        
        requestWithInfo(info, andCompletion: { (responseInfo) -> Void in
            
            println(responseInfo)
            

            
        })
        
        completion()
        
    }
    
    
    
    func updateUserWithCompletion(completion: () -> Void) {
        
        
        var info = [
            
            "method" : "PATCH",
            "endpoint" : "users/:id",
            "parameters" : [
                
                "username" : username!,
                "password" : password!,
                "email" : email!
                
            ]
            ] as [String:AnyObject]
        
        requestWithInfo(info, andCompletion: { (responseInfo) -> Void in
            
            println(responseInfo)
            
            if let accessToken = responseInfo?["access_token"] as? String {
                
                self.token = accessToken
                
                completion()
                
            }
            
        })
        
        completion()
        
    }
    
    
    
    func requestWithInfo(info: [String:AnyObject], andCompletion completion: ((responseInfo: AnyObject?) -> Void)?) {
        
        let endpoint = info["endpoint"] as! String
        
        if let url = NSURL(string: API_URL + endpoint) {
            
            let request = NSMutableURLRequest(URL: url)
            
            request.HTTPMethod = info["method"] as! String
            
            if let token = token {
                
                request.setValue(token, forHTTPHeaderField: "Access-Token")
                
            }
            
            if let bodyInfo = info["parameters"] as? [String:AnyObject] {
                
                let requestData = NSJSONSerialization.dataWithJSONObject(bodyInfo, options: NSJSONWritingOptions.allZeros, error: nil)
                
                let jsonString = NSString(data: requestData!, encoding: NSUTF8StringEncoding)
                
                let postLength = "\(jsonString!.length)"
                
                request.setValue(postLength, forHTTPHeaderField: "Content-Length")
                
                let postData = jsonString?.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: true)
                
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
                request.HTTPBody = postData
                
            }
            
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
                
                println(data)
                
                if data != nil {
                    
                    if let json: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) {
                        
                        completion?(responseInfo: json)
                        
                    }
                    
                }
                
            })
            
        }
        
    }
    
}

