//
//  Branchs.swift
//  MHealth
//
//  Created by trn1 on 3/8/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import Foundation
class Branchs: NSObject {
    var branchAddress:String = ""
    var branchId:Int = 0
    var branchLat:String = ""
    var branchLong:String = ""
    var branchNameAr:String = ""
    var branchNameEn:String = ""
    var List:[Branchs] = []
    
    override init(){
        
    }
    init( dic:NSArray ){
        
        for item  in dic{
            var i:NSDictionary = item as! NSDictionary
            var b:Branchs = Branchs()
            b.branchAddress = i.valueForKey("branchAddress") as! String
            
            
            List.append(b)
        }
    }
    
}