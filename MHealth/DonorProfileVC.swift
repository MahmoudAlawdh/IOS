//
//  DonorProfileVC.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class DonorProfileVC: UIViewController,NetworkCaller {
    
    @IBOutlet var Logout: UIButton!
    @IBAction func Logout(sender: AnyObject) {
        
        let c:UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("login"))!
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    @IBOutlet var NameField: UITextField!
    @IBOutlet var LNameField: UITextField!
    @IBOutlet var EmailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var Phone: UITextField!
    @IBOutlet var BloodTypeField: UITextField!
    @IBOutlet var NationalityField: UITextField!
    @IBOutlet var BirthDate: UITextField!    
    
    
    @IBAction func EditUpdate(sender: AnyObject) {
        let s:UIButton = sender as! UIButton
        
        if s.currentTitle! == "Edit"{
            NameField.userInteractionEnabled = true
            LNameField.userInteractionEnabled = true
            EmailField.userInteractionEnabled = true
            passwordField.userInteractionEnabled = true
            Phone.userInteractionEnabled = true
            BloodTypeField.userInteractionEnabled = true
            NationalityField.userInteractionEnabled = true
            BirthDate.userInteractionEnabled = true
            s.setTitle("Save", forState: .Normal )
        }
        else{
            
            // update profile with database
            
            var n:Networking = Networking()
            var dit = [String: AnyObject]()
            dit["civilId"] = donor.civilID
            dit["firstName"] = NameField.text
            dit["lastName"] = LNameField.text
            dit["password"] = passwordField.text
            dit["nationality"] = NationalityField.text
            dit["email"] = EmailField.text
            dit["phoneNumber"] = Phone.text
            dit["gender"] = donor.gender
            dit["bloodType"] = BloodTypeField.text
            dit["birthDate"] = "2017-01-01T00:00:00Z"
            

            n.AMJSONDictionary("http://34.196.107.188:8080/mHealthWS/ws/donor/" + "\(donor.donorID)", httpMethod: "PUT", jsonData: dit, reqId: 0, caller: self)
            
            
            NameField.userInteractionEnabled = false
            LNameField.userInteractionEnabled = false
            EmailField.userInteractionEnabled = false
            passwordField.userInteractionEnabled = false
            Phone.userInteractionEnabled = false
            BloodTypeField.userInteractionEnabled = false
            NationalityField.userInteractionEnabled = false
            BirthDate.userInteractionEnabled = false
            s.setTitle("Edit", forState: .Normal )
        }
        
    }
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        for Donor in resp {
            print(Donor)
            
        }
    }
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
        
        
        
        
        for Donor in resp {
            print(Donor)
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NameField.text = donor.firstName
        NameField.userInteractionEnabled = false
        LNameField.text = donor.lastName
        LNameField.userInteractionEnabled = false
        EmailField.text = donor.email
        EmailField.userInteractionEnabled = false
        passwordField.text = donor.password
        passwordField.userInteractionEnabled = false
        Phone.text = donor.phoneNumber
        Phone.userInteractionEnabled = false
        BloodTypeField.text = donor.bloodtype
        BloodTypeField.userInteractionEnabled = false
        NationalityField.text = donor.nationality
        NationalityField.userInteractionEnabled = false
        BirthDate.text = donor.birthDate
        BirthDate.userInteractionEnabled = false
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
