//
//  Donations.swift
//  MHealth
//
//  Created by trn24 on 4/10/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class Donations: UIViewController {

    @IBOutlet var upcoming: UIButton!
    
    @IBOutlet var campaigns: UIButton!
    
    @IBOutlet var Mydonations: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       upcoming.layer.borderWidth = 2.0
        upcoming.layer.masksToBounds = true
        upcoming.layer.borderColor = UIColor.blackColor().CGColor
        
        campaigns.layer.borderWidth = 2.0
        campaigns.layer.masksToBounds = true
        campaigns.layer.borderColor = UIColor.blackColor().CGColor
        
        Mydonations.layer.borderWidth = 2.0
        Mydonations.layer.masksToBounds = true
        Mydonations.layer.borderColor = UIColor.blackColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
