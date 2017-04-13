//
//  FogetPassViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit
import Whisper
class FogetPassViewController: UIViewController , NetworkCaller{
    
//    
//    let successMessage = “Email message was sent to you at ”
//    self.displayMessage(successMessage)
    // return

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var lblMsg: UILabel!
    
    @IBAction func confirm(sender: AnyObject) {
        
        
        let Donoremail:String = email.text!
        let networkManager:Networking = Networking()
        //networkManager.logging = true
        let reach = Reach()
        if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
            let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
            Whisper(message, to: self.navigationController!,action:.Show)
            
        }else{
        networkManager.AMJSONDictionary("http://34.196.107.188:8080/mHealthWS/ws/donor/reset/"+Donoremail, httpMethod: "GET" , jsonData:["email": Donoremail , "civilid":donor.civilID] , reqId: 5, caller: self)
        }

    }



func setArrayResponse(resp: NSArray, reqId: Int) {
}

func setDictResponse(resp: NSDictionary, reqId: Int) {
    if resp == [:] {
        
        lblMsg.text = " Success: An email was sent to you  "
        
    } else {

    lblMsg.text = " wrong email"
    
    }
    
    
    
    
}



    
    @IBOutlet var confirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let userDefaults = NSUserDefaults.standardUserDefaults()
        let langu:String = userDefaults.valueForKey("lang") as! String
        
        
        if langu == "ar" {
          
            confirm.setTitle("تاكيد", forState: .Normal)
            
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
