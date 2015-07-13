//
//  RatingsViewController.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/9/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class RatingsViewController: UIViewController {
    
    @IBAction func prettyStar(sender: PrettyStar) {
        
        sender.isStarSelected = !sender.isStarSelected
    
        
        
    }
    

    
    @IBOutlet weak var prettystarOutlet: PrettyStar!
    
    
    
    @IBAction func nextButton(sender: UIButton) {
        
        var writereviewVC = self.storyboard?.instantiateViewControllerWithIdentifier("writereviewVC")
            as! WriteReviewViewController
        
        self.navigationController?.pushViewController(writereviewVC, animated: false)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
