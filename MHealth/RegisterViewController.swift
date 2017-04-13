//
//  RegisterViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit
import Whisper

class RegisterViewController: UIViewController , NetworkCaller {
    
    
    
    @IBOutlet var civilID: UILabel!
    
    @IBOutlet var first: UILabel!
    
    @IBOutlet var last: UILabel!
    
    @IBOutlet var nation: UILabel!
    
    @IBOutlet var emaill: UILabel!
    
    @IBOutlet var pass: UILabel!
    
    @IBOutlet var phonNUm: UILabel!
    
    @IBOutlet var bloodT: UILabel!
    
    @IBOutlet weak var ID: UITextField!
    @IBOutlet weak var firstname: UITextField!
    
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var nationality: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var bloodType: UITextField!

    @IBOutlet var regs: UIButton!
    
   

    @IBOutlet var gg: UILabel!
    
    
    
    @IBOutlet var gender: UISegmentedControl!
    
    @IBAction func RegisterAction(sender: AnyObject) {
        
        let message = Message(title: "Done", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
        Whisper(message, to: self.navigationController!,action:.Show)
        
        
        var dit = [String: AnyObject]()
        dit["civilId"] = ID.text
        dit["firstName"] = firstname.text
        dit["lastName"] = lastname.text
        dit["password"] = password.text
        dit["nationality"] = nationality.text
        dit["email"] = Email.text
        dit["phoneNumber"] = phone.text
        dit["gender"] = String(gender.selectedSegmentIndex)
        dit["bloodType"] = bloodType.text
        dit["birthDate"] = "2017-01-01T00:00:00Z"
        
    
        if firstname.text == nil || firstname.text == "" || ID.text == nil || ID.text == "" || password.text == nil || password.text == ""   {
            
            //lblMsg.text = "All fields are required."
            
        } else {
            
            
        }

        
        
        
        
        let reach = Reach()
        if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
            let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
            Whisper(message, to: self.navigationController!,action:.Show)
            
        }else{
         let n:Networking = Networking()
        n.AMJSONDictionary("http://34.196.107.188:8080/mHealthWS/ws/donor", httpMethod: "POST", jsonData: dit, reqId: 0, caller: self)
        }
    }
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        
    }
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
     
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}


}