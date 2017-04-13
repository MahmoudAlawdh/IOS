//
//  ListManager.swift
//  MHealth
//
//  Created by trn24 on 4/13/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class ListManager: NSObject {
    
    struct list {
        static var CampList:NSMutableArray = NSMutableArray()
        static var DonorsList:NSMutableArray = NSMutableArray()
        static var SchedList:NSMutableArray = NSMutableArray()
        static var onsiteDonors:NSMutableArray = NSMutableArray()
        static var NotificationList:NSMutableArray = NSMutableArray()
        static var BloodRequests:NSMutableArray = NSMutableArray()
    }
    
}