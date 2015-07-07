//
//  HomeViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/2/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBAction func backButton(sender: UIButton) {
    
    var loginVC = self.storyboard?.instantiateViewControllerWithIdentifier("loginVC")
        as! ViewController
    
        self.presentViewController(loginVC, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("hello")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
