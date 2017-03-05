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
        static let BBAdmin:String = BASE + "/bbadmin"
        static let EditStatus:String = BASE + "/newdonationrecord/editStatus"
    }
    
    struct Files {
        let CACHE:String = ""
    }
    
    struct UserDefaultsKeys {
        let langKey = "lang"
        
    }
}
