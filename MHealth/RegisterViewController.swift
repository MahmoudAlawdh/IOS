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

class RegisterViewController: UIViewController , NetworkCaller, UITextFieldDelegate {
    var dateFormatter = NSDateFormatter()
    var flag = 0
    
    @IBAction func PickerAction(sender: AnyObject) {
       
        dateFormatter.dateFormat = "dd-MM-yyyy"
        var strDate = dateFormatter.stringFromDate(DatePicker.date)
        self.selectedDate.text = strDate
        print(strDate)
    }
    @IBOutlet var PickerAction: UIDatePicker!
    @IBOutlet var DatePicker: UIDatePicker!
    
    @IBOutlet var selectedDate: UILabel!
    @IBOutlet var civilID: UILabel!
    
    @IBOutlet var first: UILabel!
    
    @IBOutlet var last: UILabel!
    
    @IBOutlet var nation: UILabel!
    
    @IBOutlet var emaill: UILabel!
    
    @IBOutlet var pass: UILabel!
    
    @IBOutlet var phonNUm: UILabel!
    
    @IBOutlet var bloodT: UILabel!
    
    @IBOutlet weak var ID: HTYTextField?
    @IBOutlet weak var firstname: HTYTextField?
    
    @IBOutlet weak var lastname: HTYTextField?
    @IBOutlet weak var nationality: HTYTextField?
    
    @IBOutlet weak var Email: HTYTextField?
    
    @IBOutlet weak var password: HTYTextField?
    
    @IBOutlet weak var phone: HTYTextField?
    
    @IBOutlet weak var bloodType: HTYTextField?

    @IBOutlet var regs: UIButton!
    
   

    @IBOutlet var gg: UILabel!
    
    
    
    @IBOutlet var gender: UISegmentedControl!
    
    @IBAction func RegisterAction(sender: AnyObject) {
        
        let donorEmail = Email!.text
        let Civil = ID!.text
        
        let message = Message(title: "Done", textColor: UIColor.whiteColor(), backgroundColor: UIColor.blueColor(), images: nil)
        Whisper(message, to: self.navigationController!,action:.Show)
       

        
        var dit = [String: AnyObject]()
        dit["civilId"] = ID!.text
        dit["firstName"] = firstname!.text
        dit["lastName"] = lastname!.text
        dit["password"] = password!.text
        dit["nationality"] = nationality!.text
        dit["email"] = Email!.text
        dit["phoneNumber"] = phone!.text
        dit["gender"] = String(gender.selectedSegmentIndex)
        dit["bloodType"] = bloodType!.text
        dit["birthDate"] = dateFormatter.stringFromDate(DatePicker.date)
        dit["imgURL"] = " "
        dit["status"] = true
        dit["deleted"] = false
        
        if !Validator().ValidateCivil(Civil!) {
            let alert:UIAlertController = Alert().showeAlert("Error", msg: "Your Civil Id is Wrong")
            
            self.presentViewController(alert, animated: true, completion: nil)
            regs.enabled = true
            return

        }
        if !Validator().ValidateEmail(donorEmail!) || firstname!.text == nil || firstname!.text == "" || ID!.text == nil || ID!.text == "" || password!.text == nil || password!.text == ""   {
            
            flag = 1
            
            //lblMsg.text = "All fields are required."
            
        } else {
            flag = 0
            
        }

        
        if flag == 1{
            let alert:UIAlertController = Alert().showeAlert("Error", msg: "Please Fill in all fields")
            
            self.presentViewController(alert, animated: true, completion: nil)
            regs.enabled = true
            return
        }
        
        
        let reach = Reach()
        if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
            let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
            Whisper(message, to: self.navigationController!,action:.Show)
            
        }else{
         let n:Networking = Networking()
            print(dit)
        n.AMJSONDictionary("http://34.196.107.188:8081/MhealthWeb/webresources/donor", httpMethod: "POST", jsonData: dit, reqId: 0, caller: self)
        }
    }
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        print("resp:")
        print(resp)
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