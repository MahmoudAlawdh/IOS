//
//  CustomePrevious.swift
//  MHealth
//
//  Created by trn24 on 4/12/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class CustomePrevious: UITableViewCell {

    
    @IBOutlet weak var Donations: UILabel!
    
    @IBOutlet weak var Date: UILabel!
    
    @IBOutlet weak var destination: UILabel!
    
    @IBOutlet weak var BloodType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


