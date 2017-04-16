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
    
    
}
