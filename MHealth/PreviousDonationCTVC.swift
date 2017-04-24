//
//  PreviousDonationCTVC.swift
//  MHealth
//
//  Created by Ahmad alkandari on 4/24/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class PreviousDonationCTVC: UITableViewCell {

    @IBOutlet var Donations:UILabel!
    
    @IBOutlet var BloodType:UILabel!
    @IBOutlet var destination:UILabel!
    @IBOutlet var Date:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
