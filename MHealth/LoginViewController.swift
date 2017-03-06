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
        
        if
        
        
        for Donor in resp {
            //print(Donor)
            print( Donor.valueForKey("email")!)
            print( Donor.valueForKey("password")!)
            
            
            
            //            let d = doctor as! NSDictionary
            //            let phone:String = d.objectForKey("civilId") as! String
            //            let email:String = d.objectForKey("email") as! String
            //            let name:String = "\(d.objectForKey("firstName")!) \(d.objectForKey("middleName")!) \(d.objectForKey("lastName")!)"
            
          //  let d = doctor as! NSDictionary
            // let phone:String = d.objectForKey("phone") as! String
             //let email:String = d.objectForKey("email") as! String
            //let name:String = "\(d.objectForKey("name")!)"
          //  addFriend(name, phone: phone, email: email)
            
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
