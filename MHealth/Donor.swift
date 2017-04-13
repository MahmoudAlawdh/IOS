//
//  Donor.swift
//  MHealth
//
//  Created by trn1 on 3/6/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import Foundation
struct donor {
    static var firstName:String = ""
    static var lastName:String = ""
    static var email:String = ""
    static var password:String = ""
    static var bloodtype:String = ""
    static var birthDate:String = ""
    static var civilID:String = ""
    static var donorID:Int = 0
    static var gender:String = ""
    static var nationality:String = ""
    static var phoneNumber:String = ""
    static var state:Int = 0
    static var img:String = "";
}




















class D{

    
    var firstName:String = ""
    var lastName:String = ""
    var email:String = ""
    var password:String = ""
    var bloodtype:String = ""
    var birthDate:String = ""
    var civilID:String = ""
    var donorID:String = ""
    var gender:String = ""
    var nationality:String = ""
    var phoneNumber:String = ""
    var state:String = ""
    init(){
        
    }
    init(firstName:String,lastName:String,email:String,password:String,bloodtype:String,birthDate:String,civilID:String,donorID:String,gender:String,nationality:String,phoneNumber:String,state:String){
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.bloodtype = bloodtype
        self.birthDate = birthDate
        self.civilID = civilID
        self.donorID = donorID
        self.gender = gender
        self.nationality = nationality
        self.phoneNumber = phoneNumber
        self.state = state
        
    }
    
}