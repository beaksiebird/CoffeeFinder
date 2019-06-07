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
    self.dismiss(animated: false, completion: nil)
    
    }
    

    @IBOutlet weak var myMapView: MKMapView!
    

    let lManager = CLLocationManager()
    var allVenues: [[String:AnyObject]] = []

    
    override func viewDidLoad() {
        lManager.requestWhenInUseAuthorization()
        lManager.delegate = self
        myMapView.showsUserLocation = true
        myMapView.userTrackingMode = .follow
        myMapView.delegate = self
        lManager.startUpdatingLocation()

    }
    
    

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        print("working")
        if let location = locations.first as? CLLocation {
            
            print("latitude  \(location.coordinate.latitude) longitude \(location.coordinate.longitude)")
            
            requestVenuesWithLocation(location: location, completion: { (venues) -> () in
                
                self.allVenues = venues as! [[String:AnyObject]]
                
                for (index,venue) in venues.enumerated() {
                    
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
    
    
    func requestVenuesWithLocation(location: CLLocation, completion: @escaping (_ venues: [AnyObject]) -> ()) {
        print("Requesting Venues")
        
        let apiUrl = "https://api.foursquare.com/v2/"
        let foursquareId = "NEEAYQOQJE3WHXMGFYAPORCOB34JIWSIEVKBXIE3NUDDPBYU"
        let client_secret = "M2QIQDADDASWMBXX2GCR3WQZQA3IVBBNREEWEACRYKM3SJIP"

        let endpoint = apiUrl + "search/recommendations?ll=\(location.coordinate.latitude),\(location.coordinate.longitude)&v=20160607&intent=coffee&limit=15&client_id=\(foursquareId)&client_secret=\(client_secret)"
       // let endpoint = apiUrl + "venues/search?client_id=\(foursquareId)&client_secret=\(client_secret)&ll=\(location.coordinate.latitude),\(location.coordinate.longitude)&v=20150101&query=coffee"
        
        if let url = NSURL(string: endpoint) {
            
            let request = NSURLRequest(url: url as URL)
            
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main, completionHandler: { (response, data, error) -> Void in
                
                
                if let returnedInfo = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:AnyObject] {
                    
                    
                    if let responseInfo = returnedInfo["response"] as? [String:AnyObject] {
                        
                        
                        if let venuesInfo = responseInfo["venues"] as? [AnyObject] {
   
                            completion(venuesInfo)
                            
                        }
                        
                    }
                    
                }
                
                
            })
            
            
        }
        
        
    }
    
    
 func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation { return nil}
        
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
        
        
        annotationView.canShowCallout = true
        annotationView.pinColor = MKPinAnnotationColor.green
        
        let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
        
        annotationView.rightCalloutAccessoryView = button
        
        button.tag = (annotation as! MyAnnotation).venueIndex
        
        button.addTarget(self, action: Selector(("showMoreInfo:")), for: UIControl.Event.touchUpInside)
        
        return annotationView
    }
    
    
    
    func showMoreInfo(sender: UIButton) {
        
        let venueVC = storyboard?.instantiateViewController(withIdentifier: "venueVC") as! VenueViewController
        
        venueVC.venueInfo = allVenues[sender.tag]
        venueVC.venueID = venueVC.venueInfo?["id"] as? String
        
        present(venueVC, animated: false, completion: nil)
        
        
    }
    
}



