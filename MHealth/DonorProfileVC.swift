//
//  DonorProfileVC.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit
import Whisper
class DonorProfileVC: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate,NetworkCaller {
    
    @IBOutlet var Logout: UIButton!
    @IBAction func Logout(sender: AnyObject) {

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
    
    @IBOutlet var UpdateImage: UIButton!
    
    @IBAction func UpdateImaage(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Upload Image", message: "Choose one of the two options", preferredStyle: .ActionSheet)
        
        let CameraRollAction = UIAlertAction(title: "Camera roll", style: .Default, handler: {(action: UIAlertAction) -> Void in
            print("Camera Roll")
            
            let imagePicker:UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
            
        })
        
        let CameraAction = UIAlertAction(title: "Take photo", style: .Default, handler: {(action: UIAlertAction) -> Void in
            print("Camera ")
            let imagePicker:UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        })
        
        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {(action: UIAlertAction) -> Void in
            print("Cancel")
        })
        
        alertController.addAction(CameraAction)
        alertController.addAction(CameraRollAction)
        alertController.addAction(CancelAction)
        
        self.presentViewController(alertController, animated: true, completion: { _ in })
        
        print ("Button clicked")
    }
    
    
    
    @IBAction func EditUpdate(sender: AnyObject) {
        
        
        
        
        
        
        
        
        
        
        
        
        let s:UIButton = sender as! UIButton
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let langu:String = userDefaults.valueForKey("lang") as! String
        
        

        if s.currentTitle! == "Edit" || s.currentTitle == "تحرير"{
            NameField.userInteractionEnabled = true
            LNameField.userInteractionEnabled = true
            EmailField.userInteractionEnabled = true
            passwordField.userInteractionEnabled = true
            Phone.userInteractionEnabled = true
            BloodTypeField.userInteractionEnabled = true
            NationalityField.userInteractionEnabled = true
            BirthDate.userInteractionEnabled = true
            
            if langu == "ar" {
                s.setTitle("حفظ", forState: .Normal)
            }else{
            s.setTitle("Save", forState: .Normal )
            }
        }
        else{
            
            // update profile with database
            
            let n:Networking = Networking()
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
            dit["donorId"] = donor.donorID
            dit["status"] = true
            
            
            let reach = Reach()
            if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
                let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
                Whisper(message, to: self.navigationController!,action:.Show)
                
            }else{
            n.AMJSONDictionary("http://34.196.107.188:8080/mHealthWS/ws/donor/" + "\(donor.donorID)", httpMethod: "PUT", jsonData: dit, reqId: 0, caller: self)
            }
            
            
            NameField.userInteractionEnabled = false
            LNameField.userInteractionEnabled = false
            EmailField.userInteractionEnabled = false
            passwordField.userInteractionEnabled = false
            Phone.userInteractionEnabled = false
            BloodTypeField.userInteractionEnabled = false
            NationalityField.userInteractionEnabled = false
            BirthDate.userInteractionEnabled = false
            if langu == "ar"{
                s.setTitle("تحرير", forState: .Normal)
            }else{
                
            
            s.setTitle("Edit", forState: .Normal )
            }
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
    @IBOutlet var firstname: UILabel!
    @IBOutlet var lastname: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var password: UILabel!
  
    @IBOutlet var phonenumber: UILabel!
    
    @IBOutlet var bloodtype: UILabel!
    @IBOutlet var natinality: UILabel!
    @IBOutlet var birthdate: UILabel!
    
    @IBOutlet var publicDone: UILabel!
    
    @IBOutlet var Eedit: UIButton!
    
    
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
        
        // language
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let langu:String = userDefaults.valueForKey("lang") as! String
        
        
        if langu == "ar" {
           self.title = "الملف الشخصي"
         
          lastname.text = "الاسم الاخير"
            natinality.text = "الجنسية"
            email.text = "البريد الالكتروني"
            password.text = "الرقم السري"
            phonenumber.text = "الهاتف"
           bloodtype.text = "فصيلة الدم"
            birthdate.text = "تاريخ الميلاد"
            publicDone.text = "عام"
            Eedit.setTitle("تحرير", forState: .Normal)
            Logout.setTitle("تسجيل خروج", forState: .Normal)
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
