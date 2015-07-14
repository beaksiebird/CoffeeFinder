//
//  ReviewTableViewCell.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/14/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var reviewTextView: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
