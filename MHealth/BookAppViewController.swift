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
        
        
        /// make appointment
        
        let n:Networking = Networking()
        var dit = [String: AnyObject]()
        
        dit["place"] = donor.civilID
        dit["date"] = "2017-01-01T00:00:00Z"
        dit["bbBranchId"] = 0
        dit["donorId"] = donor.donorID
        
        n.AMJSONDictionary("http://34.196.107.188:8080/mHealthWS/ws/donationappointment/", httpMethod: "POST", jsonData: dit, reqId: 0, caller: self)
        
        
        
    }
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        
    }
    func setArrayResponse(resp: NSArray, reqId: Int) {
        
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
    let BranchsData = ["Central Blood Bank ( Jabriya ) ","Adan Hospital Blood Bank branch","Jahra Hospital Blood Bank branch", "Asima Blood Bank branch", "National Guard Blood Bank branch"]
    let day = ["1","2","3"]
    let time = ["8-10","10-12","12-2"]
    
    var UserDonation = ""
    var UserBranch = ""
    var UserDay = ""
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
            UserBranch = BranchsData[row]
            break
        case 3:
            UserDay = day[row]
            break
        case 4:
            UserTime = time[row]
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
       // let DonationTypeData = ["RBCS","AP"]
        //let BranchsData = ["Central Blood Bank ( Jabriya ) ","Adan Hospital Blood Bank branch","Jahra Hospital Blood Bank branch", "Asima Blood Bank branch", "National Guard Blood Bank branch"]
        //let day = ["1","2","3"]
        //let time = ["8-10","10-12","12-2"]
        
        

        let userDefaults = NSUserDefaults.standardUserDefaults()
        var langu:String = userDefaults.valueForKey("lang") as! String
        
        
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
            return BranchsData[row]
        case 3:
            return day[row]
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
            return BranchsData.count
        case 3:
            return day.count
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
