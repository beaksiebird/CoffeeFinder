//
//  HomeViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/2/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var coffeeChoices: UIPickerView!
    @IBOutlet weak var wifiChoices: UIPickerView!
    @IBOutlet weak var priceChoices: UIPickerView!
    @IBOutlet weak var ambianceChoices: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coffeeChoices.delegate = self
        coffeeChoices.dataSource = self
        coffeeChoices.tag = 0
        
        wifiChoices.delegate = self
        wifiChoices.dataSource = self
        wifiChoices.tag = 1
        
        priceChoices.delegate = self
        priceChoices.dataSource = self
        priceChoices.tag = 2
        
        ambianceChoices.delegate = self
        ambianceChoices.dataSource = self
        ambianceChoices.tag = 3
        
    }
    
    
    let pickerData = [
        
        ["Strong","Weak","Sweet","Organic","Fair Trade","Roasted In House"],
        
        ["Yes","No"],
        
        ["$","$$","$$$", "$$$$"],
        
        ["Study Space","Quiet","Social","Meeting"]
    ]
    
    
    @IBAction func searchButton(sender: UIButton) {
        
         RailsRequest.session().searchEstablishmentsWithCompletion { () -> Void in
            
            
            var uservenueVC = self.storyboard?.instantiateViewControllerWithIdentifier("uservenueVC")
                as! UserVenueViewController
            
            self.presentViewController(uservenueVC, animated: false, completion: nil)
        }
    }
    

    
    @IBAction func backButton(sender: UIButton) {
        
        var searchVC = storyboard?.instantiateViewControllerWithIdentifier("searchVC")
            as! SearchViewController
        
        self.presentViewController(searchVC, animated: false, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData[pickerView.tag].count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return pickerData[pickerView.tag][row]
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let choice = pickerData[pickerView.tag][row]
        
        switch pickerView.tag {
            
        case 0:
            
            RailsRequest.session().coffee_quality = row
            
        case 1:
            
            RailsRequest.session().wifi = row
            
            
        case 2:
            
            RailsRequest.session().price = row
            
            
        case 3:
            
            RailsRequest.session().ambiance = row
            
            
        default:
            
            println("You Broke My App")
            
            
            
            
                }
            }
        }
        
    


