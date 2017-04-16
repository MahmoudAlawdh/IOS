//
//  BookAppViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit
import Whisper
class BookAppViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate ,NetworkCaller{
    @IBOutlet var DonationType: UIPickerView!
    
    @IBOutlet var Branchs: UIPickerView!
    
    @IBOutlet var Day: UIPickerView!
    
    @IBOutlet var Time: UIPickerView!
    
    @IBOutlet var DT: UIButton!
    @IBOutlet var B: UIButton!
    @IBOutlet var D: UIButton!
    @IBOutlet var T: UIButton!
    @IBOutlet var Donationlabel: UILabel!
    
    let DonationTypeData = ["RBCS","Blood Cells"]
    let day:NSMutableArray = NSMutableArray()
    let time = ["8 AM - 10 AM","10 AM - 12 PM","12 PM - 2 PM","2 PM - 4 PM"]
    
    var UserDonation = ""
    var UserBranch:Branch = Branch()
    var UserDay:Slot = Slot()
    var UserTime = 0
    
    @IBAction func Confirm(sender: AnyObject) {
        let n:Networking = Networking()
        var dit = [String: AnyObject]()
        let message = Message(title: "Done", textColor: UIColor.whiteColor(), backgroundColor: UIColor.blueColor(), images: nil)
        Whisper(message, to: self.navigationController!,action:.Show)
        if UserDonation == "Blood Cells"{
        dit["day"] = UserDay.Days+"T00:00:00Z"
        dit["branchId"] = UserBranch.branchId - 1
        dit["isActive"] = 1
        dit["isPast"] = 0
        dit["isRegisteredUser"] = 1
        dit["period"] = UserTime
        dit["regUserId"] = donor.donorID
        dit["siteUserId"] = 0
        
        
        let reach = Reach()
        if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
            let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
            Whisper(message, to: self.navigationController!,action:.Show)
            
        }else{
        n.AMJSONDictionary("http://34.196.107.188:8081/MhealthWeb/webresources/schedule/", httpMethod: "POST", jsonData: dit, reqId: 0, caller: self)
        }
        }
        else{
            dit["ddate"] = UserDay.Days+"T00:00:00Z"
            dit["dnbloodtype"] = donor.bloodtype;
            dit["donationdestination"] = "bank"
            dit["donorCivilid"] = donor.civilID
            dit["status"] = "pending"
            
            
            let reach = Reach()
            if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
                let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
                Whisper(message, to: self.navigationController!,action:.Show)
                
            }else{
                n.AMJSONDictionary("http://34.196.107.188:8081/MhealthWeb/webresources/donationrecord", httpMethod: "POST", jsonData: dit, reqId: 0, caller: self)
            }
            
        }
    }
    var L:NSMutableArray = NSMutableArray()
    
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        
    }
    func setArrayResponse(resp: NSArray, reqId: Int) {
        let n:Networking = Networking()
        if reqId == 0{
            print(resp)
        }
        if reqId == -1{
            for item in resp{
                let i:NSDictionary = item as! NSDictionary
                let j:Branch = Branch()
                j.branchAddress = i.valueForKey("branchAddress") as! String
                j.branchId = i.valueForKey("branchId") as! Int
                j.branchLat = i.valueForKey("branchLat") as! String
                j.branchLong = i.valueForKey("branchLong") as! String
                j.branchNameAr = i.valueForKey("branchNameAr") as! String
                j.branchNameEn = i.valueForKey("branchNameEn") as! String
                
                L.addObject(j)
                let reach = Reach()
                if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
                    let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
                    Whisper(message, to: self.navigationController!,action:.Show)
                    
                }else{
                n.AMGetArrayData("http://34.196.107.188:8080/mHealthWS/ws/schedule/freeslots/" + "\(j.branchId)", params: [:], reqId: (j.branchId), caller: self)
                }
            }
            UserBranch = L.objectAtIndex(0) as! Branch
            
        } 
        for i in L{
            let w:Branch = i as! Branch
            var counter = 0;
            if w.branchId == reqId{
                for item in resp{

                    let i:NSDictionary = item as! NSDictionary
                    let d:Slot = Slot()
                    d.Days = i.valueForKey("day") as! String
                    d.Slots = i.valueForKey("slots") as! NSArray
                    w.day.addObject(d)
                    if counter == 0 {
                        UserDay.Days =  d.Days
                        counter = counter + 1
                    }
                }
            }
            
        }

        Branchs.reloadAllComponents()
        Day.reloadAllComponents()
        Time.reloadAllComponents()
        
    }

    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch pickerView.tag {
        case 1:
            UserDonation = DonationTypeData[row]
            break
        case 2:
            UserBranch = L.objectAtIndex(row) as! Branch ///***
            
            break
        case 3:
            UserDay = UserBranch.day.objectAtIndex(row) as! Slot
            break
        case 4:
            UserTime = row
            break
        default: break
            
        }
        
        
        

    }
    
    @IBOutlet var conf: UIButton!
    @IBOutlet var Timee: UIButton!
    @IBOutlet var dayy: UIButton!
    @IBOutlet var branchh: UIButton!
    @IBOutlet var DonType: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        DonationType.dataSource = self
        DonationType.delegate = self
        Branchs.dataSource = self
        Branchs.delegate = self
        Day.dataSource = self
        Day.delegate = self
        Time.dataSource = self
        Time.delegate = self
        
      

        let n:Networking = Networking()
        let reach = Reach()
        if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
            let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
            Whisper(message, to: self.navigationController!,action:.Show)
            
        }else{
        n.AMGetArrayData("http://34.196.107.188:8080/mHealthWS/ws/bbbranch", params: [:], reqId: -1, caller: self)
        }
        
       
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        
        switch pickerView.tag {
        case 1:
            return DonationTypeData[row]
        case 2:
            let userDefaults = NSUserDefaults.standardUserDefaults()
            let langu:String = userDefaults.valueForKey("lang") as! String
            if langu == "ar" {
                return (L.objectAtIndex(row) as! Branch).branchNameAr
            }
            return (L.objectAtIndex(row) as! Branch).branchNameEn

        case 3:
            let d:Slot = UserBranch.day.objectAtIndex(row) as! Slot
            return d.Days
        case 4:
            return time[row]
        default:
            return ""
        }
    }
    

    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        switch pickerView.tag {
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        case 4:
            return 1
        default:
            return 0
        }
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return DonationTypeData.count
        case 2:
            return L.count
        case 3:
            return UserBranch.day.count
            
        case 4:
            return time.count
        default:
            return 0
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
