//
//  LoginViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//
import SwiftSpinner
import UIKit
import Whisper
import HTYTextField
class LoginViewController: UIViewController , NetworkCaller, UITextFieldDelegate {
    var flag = 0
    @IBOutlet weak var password: HTYTextField?
    @IBOutlet weak var username: HTYTextField?
    
    @IBOutlet var register: UIButton!
    @IBOutlet var login: UIButton!
    
    @IBOutlet var forgetpassword: UIButton!
     var doneColor:UIColor = UIColor ( red: CGFloat(179/255.0), green: CGFloat(185/255.0), blue: CGFloat(255/255.0), alpha: CGFloat(1.0))
   
    var mainColor: UIColor = UIColor ( red: CGFloat(255/255.0), green: CGFloat(186/255.0), blue: CGFloat(186/255.0), alpha: CGFloat(1.0))

    
    @IBAction func donorLogin(sender: AnyObject) {
        let reach = Reach()
        if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
            let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor:mainColor, images: nil)
            Whisper(message, to: self.navigationController!,action:.Show)
           //SwiftSpinner.hide()
           

        }else{
            
            let message = Message(title: "Connected", textColor: UIColor.whiteColor(), backgroundColor: doneColor, images: nil)
            Whisper(message, to: self.navigationController!, action: .Show)
            Silent(self.navigationController!, after: 3.0)
            SwiftSpinner.show("loading..").addTapHandler({
                SwiftSpinner.hide()
                }, subtitle: "Tap to hide while connecting! Click here please ")
             
            self.networkManager.AMGetArrayData("http://34.196.107.188:8081/MhealthWeb/webresources/donor", params: [:], reqId: 0, caller: self)
            //SwiftSpinner.show(NSLocalizedString("Loading...", comment: ""))

        }
        
    }
    
    let networkManager:Networking = Networking()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        password?.delegate = self
        username?.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setDictResponse(resp: NSDictionary, reqId: Int) {
       
    }
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
        
        
        
        
        for Donor in resp {
            //print(Donor)
            if Donor.valueForKey("email")! as? String == username?.text! && Donor.valueForKey("password")! as? String == password?.text! {
                print(Donor)// big problem  validate the keys first before using it
                donor.firstName = Donor.valueForKey("firstName")! as! String
                donor.lastName = Donor.valueForKey("lastName")! as! String
                donor.birthDate = Donor.valueForKey("birthDate")! as! String
                donor.bloodtype = Donor.valueForKey("bloodType")! as! String
                donor.civilID = Donor.valueForKey("civilId")! as! String
                donor.donorID = Donor.valueForKey("donorId")! as! Int
                donor.email = Donor.valueForKey("email")! as! String
                donor.gender = Donor.valueForKey("gender")! as! String
                donor.nationality = Donor.valueForKey("nationality")! as! String
                donor.password = Donor.valueForKey("password")! as! String
                donor.phoneNumber = Donor.valueForKey("phoneNumber")! as! String
                donor.state = Donor.valueForKey("status")! as! Int
              //  donor.img = Donor.valueForKey("imgURL") as! String
                
                let c:UITabBarController = (self.storyboard?.instantiateViewControllerWithIdentifier("home")) as! UITabBarController
                self.presentViewController(c, animated: false, completion: nil)

                
                flag = 1
            }
            

            
        }
        if flag == 0{
        username!.textColor = UIColor.redColor()
        password!.textColor = UIColor.redColor()
            let alert:UIAlertController = Alert().showeAlert("Error", msg: "Please Enter Correct Email or Password")
            
            self.presentViewController(alert, animated: true, completion: nil)
            login.enabled = true
            return
            SwiftSpinner.hide()
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   override func viewDidAppear(animated: Bool) {
        username!.rightPlaceholder = "example@xyz.com"
        password!.rightPlaceholder = "password"
        SwiftSpinner.hide()
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
