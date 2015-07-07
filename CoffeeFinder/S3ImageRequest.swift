//
//  S3ImageRequest.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/2/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import Foundation

class S3ImageRequest: NSObject {

    let s3Manager = AFAmazonS3Manager(accessKeyID: accessKey, secret:secret)

    func saveImageToS3(image: UIImage) {
       
        
        let timestamp = Int(NSDate().timeIntervalSince1970)
        
        let imageName = "myImage_\(timestamp)"
        
        let imageData = UIImagePNGRepresentation(image)
        
        s3Manager.requestSerializer.bucket = bucket
        s3Manager.requestSerializer.region = AFAmazonS3USStandardRegion

        
        if let documentPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first as? String {
            
            
            let filePath = documentPath.stringByAppendingPathComponent(imageName + ".png")
            
            imageData.writeToFile(filePath, atomically: false)
            
            let fileURL = NSURL(fileURLWithPath: filePath)
            
            
            
            s3Manager.putObjectWithFile(filePath, destinationPath:imageName + ".png", parameters: nil, progress: { (bytesWritten, totalBytesWritten, totalBytesExpectedToWrite) -> Void in
                
                let percentageWritten = (CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)) * 100.0
                
                println("Uploaded \(percentageWritten)%")
                
                }, success: { (responseObject) -> Void in
                    
                    let info = responseObject as! AFAmazonS3ResponseObject
                    
                    println("\(info.URL.absoluteString)")
                    
                    var imageURL:String?
                    
                    RailsRequest.session().imageURL = info.URL.absoluteString
                    
                }, failure: { (error) -> Void in
                    
                    println("\(error)")
                    
                    
            })
            
            
        }
        
    }
    
}






