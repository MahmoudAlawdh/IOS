//
//  Const.swift
//  MHealth
//
//  Created by Ahmed on 3/4/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class Const: NSObject {

    struct URLs {
        static let BASE:String = "http://34.196.107.188:8080/mHealthWS/ws"
        static let donar:String = BASE + "/donor"
        static let EditStatus:String = BASE + "/newdonationrecord/editStatus"
        static let BBAdmin:String = BASE + "/bbadmin"

        static let donationRecord:String = BASE + "/newdonationrecord"
    }
    
    struct Files {
        let CACHE:String = ""
    }
    
    struct UserDefaultsKeys {
        static let langKey = "lang"
        
    }
}
