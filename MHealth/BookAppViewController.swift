//
//  BookAppViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class BookAppViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate ,NetworkCaller{

    @IBAction func Confirm(sender: AnyObject) {
        let n:Networking = Networking()
        var dit = [String: AnyObject]()
        dit["place"] = donor.civilID
        dit["date"] = "2017-01-01T00:00:00Z"
        dit["bbBranchId"] = 0
        dit["donorId"] = donor.donorID
        n.AMJSONDictionary("http://34.196.107.188:8080/mHealthWS/ws/donationappointment/", httpMethod: "POST", jsonData: dit, reqId: 0, caller: self)
    }
    var L:NSMutableArray = NSMutableArray()
    
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        
    }
    func setArrayResponse(resp: NSArray, reqId: Int) {
        var n:Networking = Networking()
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
                n.AMGetArrayData("http://34.196.107.188:8080/mHealthWS/ws/schedule/freeslots/" + "\(j.branchId)", params: [:], reqId: (j.branchId), caller: self)
            }
            UserBranch = L.objectAtIndex(0) as! Branch
        } 
        for i in L{
            var w:Branch = i as! Branch
            if w.branchId == reqId{
                for item in resp{
                    let i:NSDictionary = item as! NSDictionary
                    var d:Slot = Slot()
                    d.Days = i.valueForKey("day") as! String
                    d.Slots = i.valueForKey("slots") as! NSArray
                    w.day.addObject(d)
                }
            }
        }
        Branchs.reloadAllComponents()
        Day.reloadAllComponents()
        Time.reloadAllComponents()
        
    }
    @IBOutlet var DonationType: UIPickerView!

    @IBOutlet var Branchs: UIPickerView!
    
    @IBOutlet var Day: UIPickerView!
    
    @IBOutlet var Time: UIPickerView!
    
    @IBOutlet var DT: UIButton!
    @IBOutlet var B: UIButton!
    @IBOutlet var D: UIButton!
    @IBOutlet var T: UIButton!
    @IBOutlet var Donationlabel: UILabel!
    
    let DonationTypeData = ["RBCS","AP"]
    let day:NSMutableArray = NSMutableArray()

    
    var UserDonation = ""
    var UserBranch:Branch = Branch()
    var UserDay:Slot = Slot()
    var UserTime = ""
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch pickerView.tag {
        case 1:
            UserDonation = DonationTypeData[row]
            if UserDonation == "AP"{
                Donationlabel.hidden = false
                B.hidden = true
                D.hidden = true
                T.hidden = true
                Branchs.hidden = true
                Day.hidden = true
                Time.hidden = true
            }else{
                Donationlabel.hidden = true
                B.hidden = false
                D.hidden = false
                T.hidden = false
                Branchs.hidden = false
                Day.hidden = false
                Time.hidden = false
            }
            break
        case 2:
            UserBranch = L.objectAtIndex(row) as! Branch ///***
            
            break
        case 3:
            UserDay = UserBranch.day.objectAtIndex(row) as! Slot
            break
        case 4:
            UserTime = UserDay.Slots[row] as! String
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
        
        Donationlabel.hidden = true

        let n:Networking = Networking()
        
        n.AMGetArrayData("http://34.196.107.188:8080/mHealthWS/ws/bbbranch", params: [:], reqId: -1, caller: self)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let langu:String = userDefaults.valueForKey("lang") as! String
        
        
        if langu == "ar" {
            self.title = "حجز"
            DonType.setTitle("فصيلة الدم ", forState: .Normal)
            branchh.setTitle("الفرع ", forState: .Normal)
            dayy.setTitle("اليوم ", forState: .Normal)
            Timee.setTitle("الوقت", forState: .Normal)
            conf.setTitle("تاكيد", forState: .Normal)
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
            var d:Slot = UserBranch.day.objectAtIndex(row) as! Slot
            return d.Days
        case 4:
            return "ASDF"
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
        
            return 5
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
