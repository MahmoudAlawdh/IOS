//
//  FogetPassViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit
import Whisper
import HTYTextField
class FogetPassViewController: UIViewController , NetworkCaller, UITextFieldDelegate{
    
//    
//    let successMessage = “Email message was sent to you at ”
//    self.displayMessage(successMessage)
    // return

    @IBOutlet weak var email: HTYTextField?
    
    @IBOutlet var CivilID: HTYTextField?
    @IBOutlet weak var lblMsg: UILabel!
    
    @IBAction func confirm(sender: AnyObject) {
        
        
        let Donoremail:String = email!.text!
        let donorID:String = CivilID!.text!
        let networkManager:Networking = Networking()
        //networkManager.logging = true
        let reach = Reach()
        if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
            let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
            Whisper(message, to: self.navigationController!,action:.Show)
            
        }else{
        networkManager.AMJSONDictionary("http://34.196.107.188:8080/mHealthWS/ws/donor/reset/"+Donoremail, httpMethod: "GET" , jsonData:["email": Donoremail , "civilid":donorID] , reqId: 5, caller: self)
        }
        
        if !Validator().ValidateEmail(Donoremail) || !Validator().ValidateCivil(CivilID!.text!) {
            let alert:UIAlertController = Alert().showeAlert("Error", msg: " Please Enter Your Civil ID and Email Correctly ")
            
            self.presentViewController(alert, animated: true, completion: nil)
            confirm.enabled = true
            return
        

        }else{
            let alert:UIAlertController = Alert().showeAlert("Success", msg: " Success An email was sent to you  ")
            
            self.presentViewController(alert, animated: true, completion: nil)
            confirm.enabled = true
            return        }

    }

    override func viewDidAppear(animated: Bool) {
        email!.rightPlaceholder = "Enter Your Email"
        CivilID!.rightPlaceholder = "Enter Your Civil Id"
    }

func setArrayResponse(resp: NSArray, reqId: Int) {
}

func setDictResponse(resp: NSDictionary, reqId: Int) {
    if resp == [:] {
        
        lblMsg.text = " Success An email was sent to you  "
        
    } else {

        lblMsg.text = " error  "
    
    }
    
    
    
    
}


    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBOutlet var confirm: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        email?.delegate = self
        
        CivilID?.delegate = self
       
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
