//
//  CustomeUpcomingTableViewCell.swift
//  MHealth
//
//  Created by trn24 on 4/11/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class CustomeUpcomingTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var UpcomingTableView: UILabel!
    
    @IBOutlet weak var Date: UILabel!
    
    @IBOutlet weak var Destination: UILabel!
    
    @IBOutlet weak var BloodType: UILabel!
    
    var zainab:UpcomingTableVC!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
