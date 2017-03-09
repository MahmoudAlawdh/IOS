//
//  RegisterViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

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

        
        
        
        
        
         let n:Networking = Networking()
        n.AMJSONDictionary("http://34.196.107.188:8080/mHealthWS/ws/donor", httpMethod: "POST", jsonData: dit, reqId: 0, caller: self)
    }
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        
    }
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let langu:String = userDefaults.valueForKey("lang") as! String
        
        
        if langu == "ar" {
           civilID.text = "الرقم المدني"
            first.text = "الاسم الاول"
            last.text = "الاسم الاخير"
            nation.text = "الجنسية"
            emaill.text = "البريد الالكتروني"
            pass.text = "الرقم السري"
            phonNUm.text = "الهاتف"
            bloodT.text = "فصيلة الدم"
            gg.text = "الجنس"

            gender.setTitle("انثى", forSegmentAtIndex: 0)
            gender.setTitle("ذكر", forSegmentAtIndex: 1)
            regs.setTitle("سجل", forState: .Normal)
         
            
        }
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}


}