//
//  ResultsViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/2/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class MyAnnotation : MKPointAnnotation {
    
    var venueIndex: Int!
}

class ResultsViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
   @IBAction func backButton(sender: UIButton) {
        
        var homeVC = self.storyboard?.instantiateViewControllerWithIdentifier("homeVC")
            as! HomeViewController
        
        self.presentViewController(homeVC, animated: false, completion: nil)
        
        
    }
    
    
    
    @IBOutlet weak var myMapView: MKMapView!
    
    
    var lManager = CLLocationManager()
    
    var allVenues: [[String:AnyObject]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lManager.requestWhenInUseAuthorization()
        
        lManager.delegate = self
        
        myMapView.showsUserLocation = true
        myMapView.userTrackingMode = .Follow
        myMapView.delegate = self
        
        
        lManager.startUpdatingLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        if let location = locations.first as? CLLocation {
            
            println("latitude  \(location.coordinate.latitude) longitude \(location.coordinate.longitude)")
            
            requestVenuesWithLocation(location, completion: { (venues) -> () in
                
                self.allVenues = venues as! [[String:AnyObject]]
                
                for (index,venue) in enumerate(venues as! [[String:AnyObject]]) {
                    
                    if let locationInfo = venue["location"] as? [String:AnyObject] {
                        
                        if let lat = locationInfo["lat"] as? Double, let lng = locationInfo["lng"] as? Double {
                            
                            let coordinate = CLLocationCoordinate2DMake(lat, lng)
                            
                            let annotation = MyAnnotation()
                            
                            annotation.title = venue["name"] as? String
                            annotation.venueIndex = index
                            annotation.coordinate = coordinate
                            
                            self.myMapView.addAnnotation(annotation)
                            
                        }
                        
                    }
                    
                }
                
            })
            
            lManager.stopUpdatingLocation()
            
            
        }
        
        
        
        
    }
    
    
    func requestVenuesWithLocation(location: CLLocation, completion: (venues: [AnyObject]) -> ()) {
        
        let apiUrl = "https://api.foursquare.com/v2/"
        let foursquareId = "NEEAYQOQJE3WHXMGFYAPORCOB34JIWSIEVKBXIE3NUDDPBYU"
        let client_secret = "M2QIQDADDASWMBXX2GCR3WQZQA3IVBBNREEWEACRYKM3SJIP"
        
        let endpoint = apiUrl + "venues/search?client_id=\(foursquareId)&client_secret=\(client_secret)&ll=\(location.coordinate.latitude),\(location.coordinate.longitude)&v=20150101&query=coffee"
        
        println(endpoint)
        
        if let url = NSURL(string: endpoint) {
            
            let request = NSURLRequest(URL: url)
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
                
                
                if let returnedInfo = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as? [String:AnyObject] {
                    
                    println("Test 123 \(returnedInfo)")
                    
                    if let responseInfo = returnedInfo["response"] as? [String:AnyObject] {
                        
                        
                        if let venuesInfo = responseInfo["venues"]/*!["name"]*/ as? [AnyObject] {
                        
                                
                                //println("This is venue type NAME :\(venuesInfo)")
                                
                            
                            completion(venues: venuesInfo)
                            
                        }
                        
                    }
                    
                }
                
                
            })
            
            
        }
        
        
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        if annotation is MKUserLocation { return nil}
        
        var annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
        
        
        annotationView.canShowCallout = true
        annotationView.pinColor = MKPinAnnotationColor.Green
        
        var button = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as! UIButton
        
        annotationView.rightCalloutAccessoryView = button
        
        button.tag = (annotation as! MyAnnotation).venueIndex
        
        button.addTarget(self, action: "showMoreInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return annotationView
    }
    
    
    
    func showMoreInfo(sender: UIButton) {
        
        var venueVC = storyboard?.instantiateViewControllerWithIdentifier("venueVC") as! VenueViewController
        
        // send venueInfo to venueVC
        venueVC.venueInfo = allVenues[sender.tag]
        
        presentViewController(venueVC, animated: false, completion: nil)
        
        
    }
    
}



