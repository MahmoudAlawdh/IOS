//
//  LoginViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController , NetworkCaller {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBAction func donorLogin(sender: AnyObject) {
    
        self.networkManager.AMGetArrayData("http://34.196.107.188:8080/mHealthWS/ws/donor", params: [:], reqId: 0, caller: self)
    }
    let networkManager:Networking = Networking()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        
    }
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
        
        
        
        
        for Donor in resp {
            //print(Donor)
            if Donor.valueForKey("email")! as! String == username.text! && Donor.valueForKey("password")! as! String == password.text! {
                print(Donor)
                donor.firstName = Donor.valueForKey("firstName")! as! String
                donor.lastName = Donor.valueForKey("firstName")! as! String
                donor.birthDate = Donor.valueForKey("firstName")! as! String
                donor.bloodtype = Donor.valueForKey("firstName")! as! String
                donor.civilID = Donor.valueForKey("firstName")! as! String
                donor.donorID = Donor.valueForKey("firstName")! as! String
                donor.email = Donor.valueForKey("firstName")! as! String
                donor.gender = Donor.valueForKey("firstName")! as! String
                donor.lastName = Donor.valueForKey("firstName")! as! String
                donor.nationality = Donor.valueForKey("firstName")! as! String
                donor.password = Donor.valueForKey("firstName")! as! String
                donor.phoneNumber = Donor.valueForKey("firstName")! as! String
                donor.state = Donor.valueForKey("firstName")! as! String
            }
            
        }

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
