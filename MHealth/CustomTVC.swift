//
//  CustomTVC.swift
//  MHealth
//
//  Created by trn2 on 4/10/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class CustomTVC: UITableViewCell{


    @IBOutlet var notifcationText: UILabel!
    @IBOutlet var titleText: UILabel!
    @IBOutlet var descriptionText: UILabel!
    var zainab:NotfcationVC!
    
    @IBOutlet var button: UIButton!
    @IBAction func shareButton(sender: AnyObject) {
        
        let message:String = "\(notifcationText.text) \(titleText.text) \(descriptionText.text)"

        let activityAC = UIActivityViewController(activityItems: [message], applicationActivities: nil)
        activityAC.popoverPresentationController?.sourceView = self
        zainab.presentViewController(activityAC, animated: true, completion: nil)
               
        
        
    }
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
