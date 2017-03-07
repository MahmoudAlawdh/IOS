//
//  RegisterViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController , NetworkCaller {
    
    @IBOutlet weak var ID: UITextField!
    @IBOutlet weak var firstname: UITextField!
    
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var nationality: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var passowrd: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var bloodType: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBAction func RegisterAction(sender: AnyObject) {
        var dit = [String: AnyObject]()
        dit["civilId"] = ID.text
        dit["firstName"] = firstname.text
        dit["lastName"] = lastname.text
        dit["password"] = passowrd.text
        dit["nationality"] = nationality.text
        dit["email"] = Email.text
        dit["phoneNumber"] = phone.text
        dit["gender"] = String(gender.selectedSegmentIndex)
        dit["bloodType"] = bloodType.text
        dit["birthDate"] = "2017-01-01T00:00:00Z"
        
         var n:Networking = Networking()
        n.AMJSONDictionary("http://34.196.107.188:8080/mHealthWS/ws/donor", httpMethod: "POST", jsonData: dit, reqId: 0, caller: self)
    }
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        
    }
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}


}