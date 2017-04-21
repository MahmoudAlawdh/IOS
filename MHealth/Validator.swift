//
//  Validator.swift
//  MHealth
//
//  Created by Ahmed on 3/4/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class Validator: NSObject {

    
    func ValidateEmail(email :String) -> Bool{
        if email == ""  || !email.containsString("@"){
            return false
        }
        return true
    }
    
    func ValidateCivil(civil :String) -> Bool{
        if civil.characters.count == 12{
            return true
        }
        return false
    }
    
    func verifyUrl (urlString: String?) -> Bool {
        //Check for nil
        if let urlString = urlString {
            // create NSURL instance
            if let url = NSURL(string: urlString) {
                // check if your application can open the NSURL instance
                return UIApplication.sharedApplication().canOpenURL(url)
            }
        }
        return false
    }
}
