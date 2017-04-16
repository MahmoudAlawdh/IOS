//
//  Alert.swift
//  MHealth
//
//  Created by trn1 on 4/16/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//


import UIKit

class Alert: NSObject {
    
    func showeAlert(title :String, msg: String) -> UIAlertController {
        
        let alertController:UIAlertController = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        
        let action:UIAlertAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        
        alertController.addAction(action)
        
        return alertController
    }
}
