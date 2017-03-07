//
//  RegisterViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
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
    }
       // var firstname = self.firstname.text
     //   var lastname = self.lastname.text
     //   var password = self.password.text
       // var email = self.Email.text
      //  var CivilID = self.IDField.text
   //     var Nationality = self.nationalityField.text
    //    var phone = self.phoneField.text
    //    var Bloodtype = self.bloodTypeField.text
    //    var Gender = self.genderField.text
        
        // Validate the text fields
        //if count(firstname < 5 {
          //  var alert = UIAlertView(title: "Invalid", message: "firstname must be greater than 5 characters", delegate: self, cancelButtonTitle: "OK")
        //    alert.show()
            
      //  } else if count(password) < 8 {
        //    var alert = UIAlertView(title: "Invalid", message: "Password must be greater than 8 characters", delegate: self, cancelButtonTitle: "OK")
          //  alert.show()
            
        //} else if count(email) < 8 {
          //  var alert = UIAlertView(title: "Invalid", message: "Please enter a valid email address", delegate: self, cancelButtonTitle: "OK")
        //    alert.show()
            
      //  } else {
            // Run a spinner to show a task in progress
           // var spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
           // spinner.startAnimating()
            
            // var newUser = PFUser()
            
            //  newUser.username = username
            //   newUser.password = password
            //  newUser.email = finalEmail
            
            // Sign up the user asynchronously
            //       newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
            
            // Stop the spinner
            //spinner.stopAnimating()
            //if ((error) != nil) {
                //var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                //alert.show()
                
            //} else {
                //var alert = UIAlertView(title: "Success", message: "Signed Up", delegate: self, cancelButtonTitle: "OK")
                //alert.show()
               // dispatch_async(dispatch_get_main_queue(), { () -> Void in
             //       let viewController:MyDnationsVC = self.storyboard!.instantiateViewControllerWithIdentifier("Home") as! MyDnationsVC
            //        self.presentViewController(viewController, animated: true, completion: nil)
          //      })
                //            }
                //        })
        //    }
      //  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}


}