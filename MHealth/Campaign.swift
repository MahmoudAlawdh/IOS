import UIKit

class Campaign: NSObject, DataHolder {
    var LLat:String         = "0"
    var LLong:String        = "0"
    var bloodTypes:String   = ""
    var enddate:String      = ""
    var locationName:String = ""
    var startdate:String    = ""
    var status:String       = ""
    var CFDId:Int           = 0
    
    var name:String         = ""
    
    
    
    func toDictionary() -> NSDictionary {
        let values:NSMutableDictionary = NSMutableDictionary()
        values.setValue(LLat,           forKey: "LLat")
        values.setValue(LLong,          forKey: "LLong")
        values.setValue(bloodTypes,     forKey: "bloodTypes")
        values.setValue(enddate,        forKey: "enddate")
        values.setValue(locationName,   forKey: "locationName")
        values.setValue(startdate,      forKey: "startdate")
        values.setValue(status,         forKey: "status")
        values.setValue(CFDId,          forKey: "CFDId")
        
        values.setValue(self.name,      forKey: "name")
        return values
    }
    
    func loadDictionary(values: NSDictionary) {
        
        self.LLat           = values.valueForKey("LLat") as! String
        self.LLong          = values.valueForKey("LLong") as! String
        self.bloodTypes     = values.valueForKey("bloodTypes") as! String
        self.enddate        = values.valueForKey("enddate") as! String
        self.locationName   = values.valueForKey("locationName") as! String
        self.startdate      = values.valueForKey("startdate") as! String
        self.status         = values.valueForKey("status") as! String
        self.CFDId          = values.valueForKey("CFDId") as! Int
        
        self.name           = values.valueForKey("name") as! String
        
    }
    
    
}