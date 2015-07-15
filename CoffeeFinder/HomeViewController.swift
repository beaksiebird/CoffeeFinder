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
        
        //RAILS REQUEST HERE
        
        
    }
    

    
    @IBAction func backButton(sender: UIButton) {
    
        var loginVC = self.storyboard?.instantiateViewControllerWithIdentifier("loginVC")
        as! ViewController
    
        presentViewController(loginVC, animated: false, completion: nil)
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
    
    var coffeeChoice: String?
    var wifiChoice: String?
    var priceChoice: String?
    var ambianceChoice: String?
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let choice = pickerData[pickerView.tag][row]
        
        switch pickerView.tag {
            
        case 0:
            
            coffeeChoice = choice
            
        case 1:
            
            wifiChoice = choice
            
            
        case 2:
            
            priceChoice = choice
            
        case 3:
            
            ambianceChoice = choice
            
        default:
            
            println("You Broke My App")
            
            
            
            
                }
            }
        }
        
    


