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
        //static let BASE:String = "http://34.196.107.188:8080/mHealthWS/ws"
        static let BASE:String = "http://34.196.107.188:8081/MhealthWeb/webresources/"
       
        static let donar:String = BASE + "donor"
        static let BBAdmin:String = BASE + "bbadmin"

        static let DonationRecord:String = BASE + "donationrecord"
        static let Schedule:String = BASE + "schedule" ;
        //static let Donationrecord:String = BASE + "donationrecord" ;
        static let EditStatus:String = DonationRecord + "/editStatus"
        
        static let login:String = Const.URLs.donar + "/login"
        static let UploadImage:String = "http://34.196.107.188:8081/MhealthWeb/addimgtogallery"

    }
    
    struct Files {
        let CACHE:String = ""
    }
    
    struct UserDefaultsKeys {
        static let langKey = "lang"
        static let donorProfile = "donorProfile"
    }
}
