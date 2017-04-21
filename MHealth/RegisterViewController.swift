//
//  RegisterViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit
import Whisper
import HTYTextField
import SwiftSpinner

class RegisterViewController: UIViewController , NetworkCaller, UITextFieldDelegate {
    var dateFormatter = NSDateFormatter()
    var flag = 0
    var mainColor: UIColor = UIColor ( red: CGFloat(255/255.0), green: CGFloat(186/255.0), blue: CGFloat(186/255.0), alpha: CGFloat(1.0))
    var doneColor:UIColor = UIColor ( red: CGFloat(179/255.0), green: CGFloat(185/255.0), blue: CGFloat(255/255.0), alpha: CGFloat(1.0))
    
    
//    @IBAction func PickerAction(sender: AnyObject) {
//       
//        //dateFormatter.dateFormat = "dd-MM-yyyy"
//        //var strDate = dateFormatter.stringFromDate(DatePicker.date)
//        //self.selectedDate.text = strDate
//       // print(strDate)
//    }
    @IBOutlet var PickerAction: UIDatePicker!
    @IBOutlet var DatePicker: UIDatePicker!
//    
//    @IBOutlet var selectedDate: UILabel!
//    @IBOutlet var civilID: UILabel!
//    
//    @IBOutlet var first: UILabel!
//    
//    @IBOutlet var last: UILabel!
//    
//    @IBOutlet var nation: UILabel!
//    
//    @IBOutlet var emaill: UILabel!
//    
//    @IBOutlet var pass: UILabel!
//    
//    @IBOutlet var phonNUm: UILabel!
//    
//    @IBOutlet var bloodT: UILabel!
    
    @IBOutlet weak var ID: HTYTextField?
    @IBOutlet weak var firstname: HTYTextField?
    
    @IBOutlet weak var lastname: HTYTextField?
    @IBOutlet weak var nationality: HTYTextField?
    
    @IBOutlet weak var Email: HTYTextField?
    
    @IBOutlet weak var password: HTYTextField?
    
    @IBOutlet weak var phone: HTYTextField?
    
    @IBOutlet weak var bloodType: HTYTextField?

    @IBOutlet var regs: UIButton!
    
   

//    @IBOutlet var gg: UILabel!
    
    
    @IBAction func PickerAction(sender: UIDatePicker) {
        dateFormatter.dateFormat = "yyyy-MM-dd"
                var strDate = dateFormatter.stringFromDate(DatePicker.date)
                //self.selectedDate.text = strDate
                print("\(strDate)T00:00:00Z" )
    }
    
    @IBOutlet var gender: UISegmentedControl!
    
    @IBAction func RegisterAction(sender: AnyObject) {
        
        let donorEmail = Email!.text
        let Civil = ID!.text
        
    

        var dit = [String: AnyObject]()
        dit["civilId"] = ID!.text
        dit["firstName"] = firstname!.text
        dit["lastName"] = lastname!.text
        dit["password"] = password!.text
        dit["nationality"] = nationality!.text
        dit["email"] = Email!.text
        dit["phoneNumber"] = phone!.text
        
        if gender.selectedSegmentIndex == 0 {
            dit["gender"] = "m"
        }else{
            dit["gender"] = "f"
        }
        
        dit["bloodType"] = bloodType!.text
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var strDate = dateFormatter.stringFromDate(DatePicker.date)
        strDate = "\(strDate)T00:00:00Z"
        
        dit["birthDate"] = strDate
        dit["imgURL"] = " "
        dit["status"] = true
        dit["deleted"] = false
        
      
       
        
        let reach = Reach()
        if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
            let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: mainColor, images: nil)
            Whisper(message, to: self.navigationController!,action:.Show)
            
        }else{
            SwiftSpinner.show(NSLocalizedString("Connecting...", comment: ""))

         let n:Networking = Networking()
            print("request register")
            print(dit)
        n.AMJSONDictionary("http://34.196.107.188:8081/MhealthWeb/webresources/donor", httpMethod: "POST", jsonData: dit, reqId: 0, caller: self)
        }
    }
    func setDictResponse(resp: NSDictionary, reqId: Int) {
       SwiftSpinner.hide()
        
        print("resp:")
        print(resp)
        
        
        
        if (resp.valueForKey("errorMsgEn") != nil) {
            let errorCode:Int = resp.valueForKey("errorCode") as! Int
            let result:String = resp.valueForKey("errorMsgEn") as! String
            
            
            if errorCode == 406 {
                let alert:UIAlertController = Alert().showeAlert("Error", msg: "Email already used")
                self.presentViewController(alert, animated: true, completion: nil)
            }else if result == "Accepted"{
            
                let alertControlle:UIAlertController = UIAlertController(title: "Confirm", message: "Regirstration is successful. Thank you", preferredStyle: .Alert)
                
                //UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                let action:UIAlertAction =  UIAlertAction(title: "OK", style: .Cancel, handler: { (UIAlertAction) in
                    self.navigationController?.popViewControllerAnimated(true)
                })
                alertControlle.addAction(action)
                self.presentViewController(alertControlle, animated: true, completion: nil)
            }else{
              
                let alert:UIAlertController = Alert().showeAlert("Error", msg: "Can't register right now")
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }else{
            let alert:UIAlertController = Alert().showeAlert("Error", msg: "Connection Failed")
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
    }
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ID?.delegate = self
        firstname?.delegate = self
        
        lastname?.delegate = self
        nationality?.delegate = self
        
        Email?.delegate = self
        
        password?.delegate = self
        
        phone?.delegate = self
        
        bloodType?.delegate = self
        
        DatePicker.maximumDate = NSDate()
        
    }
    override func viewDidAppear(animated: Bool) {
    
        ID!.rightPlaceholder = "Civil ID"
        firstname!.rightPlaceholder = "First Name"
        lastname!.rightPlaceholder = "Last Name"
        password!.rightPlaceholder = "Password"
        Email!.rightPlaceholder = "Example@xyz.com"
        nationality!.rightPlaceholder = "Nationality"
        bloodType!.rightPlaceholder = "Blood Type"
        phone!.rightPlaceholder = "Phone Number"
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}


}