//
//  DonorProfileVC.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit
import Whisper
import SwiftSpinner
import SDWebImage

class DonorProfileVC: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate,NetworkCaller , UITextFieldDelegate{
    var dateFormatter = NSDateFormatter()
    @IBOutlet var img: UIImageView!
    @IBOutlet var DatePicker: UIDatePicker!
    @IBOutlet var SelectedDate: UILabel!
    @IBOutlet var Logout: UIButton!
    
    
    var mainColor: UIColor = UIColor ( red: CGFloat(255/255.0), green: CGFloat(186/255.0), blue: CGFloat(186/255.0), alpha: CGFloat(1.0))

    
    @IBAction func PickerAction(sender: AnyObject) {
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var strDate = dateFormatter.stringFromDate(DatePicker.date)
        self.SelectedDate.text = strDate
        
    }
    
    let networkManagr:Networking = Networking()

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func Logout(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: Const.UserDefaultsKeys.donorProfile)

    }
    @IBOutlet var NameField: UITextField!
    @IBOutlet var LNameField: UITextField!
    @IBOutlet var EmailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var Phone: UITextField!
    @IBOutlet var BloodTypeField: UITextField!
    @IBOutlet var NationalityField: UITextField!
    
    @IBOutlet var UpdateImage: UIButton!
    var updatedProfile:NSMutableDictionary?
    
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
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        img.image = image
        //Encode base64
        let imageData = UIImagePNGRepresentation(image)
        //var base64 = dataImage.base64EncodedStringWithOptions(NSDataBase64Encoding64CharacterLineLength)
        let strBase64:String = imageData!.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
        
        //Decode
        // let dataDecoded:NSData = NSData(base64EncodedString: strBase64, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)!
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
        let reach = Reach()
        if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
            let message = Message(title: "No Internet Connection", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
            Whisper(message, to: self.navigationController!, action: .Show)
            Silent(self.navigationController!, after: 3.0)
        }else{

            let params:[String:AnyObject] = ["appID": "donor" , "imgData": strBase64,"title":"" , "description":""]
            let networkManager: Networking = Networking()
            SwiftSpinner.show(NSLocalizedString("Uploading...", comment: ""))

            networkManager.AMPostDictData(Const.URLs.UploadImage, params: params, reqId: 1, caller: self)
            
        }
        
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafePointer<Void>) {
        
        //        if error == nil {
        //            let ac = UIAlertController(title: "Saved!", message: "Your image has been saved to your photos.", preferredStyle: .Alert)
        //            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        //            presentViewController(ac, animated: true, completion: nil)
        //        } else {
        //            let ac = UIAlertController(title: "Save error", message: error?.localizedDescription, preferredStyle: .Alert)
        //            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        //            presentViewController(ac, animated: true, completion: nil)
        //        }
    }
    
    
    
    
    @IBAction func EditUpdate(sender: AnyObject) {
        
        
        let s:UIButton = sender as! UIButton
        
        if s.titleLabel?.text == "Edit" || s.titleLabel?.text == "تحرير"{
            NameField.userInteractionEnabled = true
            LNameField.userInteractionEnabled = true
            EmailField.userInteractionEnabled = true
            passwordField.userInteractionEnabled = true
            Phone.userInteractionEnabled = true
            BloodTypeField.userInteractionEnabled = true
            NationalityField.userInteractionEnabled = true
            SelectedDate.userInteractionEnabled = true
            
            s.setTitle("Save", forState: .Normal)
            
            
        }else{
            
            let donorEmail = EmailField!.text
            
            if !Validator().ValidateEmail(donorEmail!) {
                
                let alert:UIAlertController = Alert().showeAlert("Error", msg: "Please Enter a valid email")
                self.presentViewController(alert, animated: true, completion: nil)
                return
                
            }else if passwordField!.text!.characters.count < 8 {
                
                let alert:UIAlertController = Alert().showeAlert("Error", msg: "password must be more than 8 characters")
                self.presentViewController(alert, animated: true, completion: nil)
                
                return
            }else if NameField!.text == "" ||  passwordField!.text == "" || LNameField?.text == "" || NationalityField?.text == "" || Phone?.text == "" {
                let alert:UIAlertController = Alert().showeAlert("Error", msg: "Please Fill in all fields")
                self.presentViewController(alert, animated: true, completion: nil)
                return
            }
            
            var strBloodType:String = (BloodTypeField?.text)!
            strBloodType = strBloodType.uppercaseString
            print(strBloodType)
            if strBloodType != "A+" && strBloodType != "A-" && strBloodType != "B+" && strBloodType != "B-" && strBloodType  != "O+" && strBloodType != "O-" && strBloodType != "AB+" && strBloodType != "AB-"{
                let alert:UIAlertController = Alert().showeAlert("Error", msg: "Please enter a valid blood type. (A+,A-,B+,B-,O+,O-,AB+,AB-)")
                self.presentViewController(alert, animated: true, completion: nil)
                return
            }
            
            // update profile with database
            
            updatedProfile = NSMutableDictionary()
            updatedProfile?.setValue(donor.civilID, forKey: "civilId")
            updatedProfile?.setValue(NameField.text, forKey: "firstName")
            updatedProfile?.setValue(LNameField.text, forKey: "lastName")
            updatedProfile?.setValue(passwordField.text, forKey: "password")
            updatedProfile?.setValue(NationalityField.text, forKey: "nationality")
            updatedProfile?.setValue(EmailField.text, forKey: "email")
            updatedProfile?.setValue(Phone.text, forKey: "phoneNumber")
            updatedProfile?.setValue(donor.gender, forKey: "gender")
            updatedProfile?.setValue(strBloodType, forKey: "bloodType")
            
            dateFormatter.dateFormat = "yyyy-MM-dd"
            var strDate = dateFormatter.stringFromDate(DatePicker.date)
            strDate = "\(strDate)T00:00:00Z"
            
            updatedProfile?.setValue(strDate, forKey: "birthDate")
            updatedProfile?.setValue(donor.donorID, forKey: "donorId")
            updatedProfile?.setValue(true, forKey: "status")
            updatedProfile?.setValue(donor.img, forKey: "imgURL")
            updatedProfile?.setValue(false, forKey: "deleted")
            
            
            
            let reach = Reach()
            if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
                let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
                Whisper(message, to: self.navigationController!,action:.Show)
                
            }else{
                print(updatedProfile!)
                SwiftSpinner.show(NSLocalizedString("Loading...", comment: ""))
                s.setTitle("Edit", forState: .Normal)
                
                networkManagr.AMJSONDictionary(Const.URLs.donar + "\(donor.donorID)", httpMethod: "PUT", jsonData: updatedProfile!, reqId: 0, caller: self)
            }
        }
        
    }
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        print(resp)
        print(reqId)
        SwiftSpinner.hide()
        
        
        if reqId == 0 {
            if (resp.valueForKey("errorMsgEn") != nil && ((resp.valueForKey("errorMsgEn") as! String) != "Done")  ){
            
           
                let alert:UIAlertController = Alert().showeAlert("Error", msg: "Failed to update profile")
                self.presentViewController(alert, animated: true, completion: nil)
                return
            }
            donor.firstName = updatedProfile!.valueForKey("firstName")! as! String
            donor.lastName = updatedProfile!.valueForKey("lastName")! as! String
            donor.birthDate = updatedProfile!.valueForKey("birthDate")! as! String
            donor.bloodtype = updatedProfile!.valueForKey("bloodType")! as! String
            donor.civilID = updatedProfile!.valueForKey("civilId")! as! String
            donor.donorID = updatedProfile!.valueForKey("donorId")! as! Int
            donor.email = updatedProfile!.valueForKey("email")! as! String
            donor.gender = updatedProfile!.valueForKey("gender")! as! String
            donor.nationality = updatedProfile!.valueForKey("nationality")! as! String
            donor.password = updatedProfile!.valueForKey("password")! as! String
            donor.phoneNumber = updatedProfile!.valueForKey("phoneNumber")! as! String
            donor.state = updatedProfile!.valueForKey("status")! as! Int
            if updatedProfile!.valueForKey("imgURL") != nil {
                donor.img = updatedProfile!.valueForKey("imgURL") as! String
            }
            
            
            NameField.userInteractionEnabled = false
            LNameField.userInteractionEnabled = false
            EmailField.userInteractionEnabled = false
            passwordField.userInteractionEnabled = false
            Phone.userInteractionEnabled = false
            BloodTypeField.userInteractionEnabled = false
            NationalityField.userInteractionEnabled = false
            //       BirthDate.userInteractionEnabled = false
            let alert:UIAlertController = Alert().showeAlert("Updated", msg: "Profile is updated")
            self.presentViewController(alert, animated: true, completion: nil)
        }
        if reqId == 1 {
            if (resp.valueForKey("errorMsgEn") != nil) {
                let result:String = resp.valueForKey("errorMsgEn") as! String
                if result.lowercaseString == "Done".lowercaseString{
                    let alertControlle:UIAlertController = UIAlertController(title: NSLocalizedString("Image Upload", comment: ""), message: NSLocalizedString("Upload successful", comment: ""), preferredStyle: .Alert)
                    
                    //UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                    let action:UIAlertAction =  UIAlertAction(title: NSLocalizedString( "OK", comment: ""), style: .Cancel, handler: { (UIAlertAction) in
                        let imgPath:String = resp.valueForKey("imgPath") as! String
                        self.UpdateDonorProfileImage(imgPath)
                    })
                    alertControlle.addAction(action)
                    self.presentViewController(alertControlle, animated: true, completion: nil)
                }else{
                   
                    let alert:UIAlertController = Alert().showeAlert("Error", msg: "Can't upload image right now")
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    func UpdateDonorProfileImage(imgPath:String) {
        
        updatedProfile = NSMutableDictionary()
        updatedProfile?.setValue(donor.civilID, forKey: "civilId")
        updatedProfile?.setValue(donor.firstName, forKey: "firstName")
        updatedProfile?.setValue(donor.lastName, forKey: "lastName")
        updatedProfile?.setValue(donor.password, forKey: "password")
        updatedProfile?.setValue(donor.nationality, forKey: "nationality")
        updatedProfile?.setValue(donor.email, forKey: "email")
        updatedProfile?.setValue(donor.phoneNumber, forKey: "phoneNumber")
        updatedProfile?.setValue(donor.gender, forKey: "gender")
        updatedProfile?.setValue(donor.bloodtype, forKey: "bloodType")
        updatedProfile?.setValue(donor.birthDate, forKey: "birthDate")
        updatedProfile?.setValue(donor.donorID, forKey: "donorId")
        updatedProfile?.setValue(true, forKey: "status")
        updatedProfile?.setValue(imgPath, forKey: "imgURL")
        updatedProfile?.setValue(false, forKey: "deleted")
        
        let reach = Reach()
        //
        print ("Connection status!!!!!!!:")
        if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
            let message = Message(title: NSLocalizedString("No Internet Connection", comment: ""), textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
            Whisper(message, to: self.navigationController!, action: .Show)
            Silent(self.navigationController!, after: 3.0)
        }else{
            
            SwiftSpinner.show(NSLocalizedString("Loading...", comment: ""))
            
            networkManagr.AMJSONDictionary(Const.URLs.donar + "/\(donor.donorID)", httpMethod: "PUT", jsonData: updatedProfile!, reqId: 0, caller: self)
        }
    }
    
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
    }
    
    @IBOutlet var publicDone: UILabel!
    
    @IBOutlet var Eedit: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameField.delegate = self
        LNameField.delegate = self
        EmailField.delegate = self
        passwordField.delegate = self
        Phone.delegate = self
        BloodTypeField.delegate = self
        NationalityField.delegate = self
        
        
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
        
        let dateArr:[String] = donor.birthDate.characters.split{$0 == "T"}.map(String.init)
        if dateArr.count == 2 {
            SelectedDate.text = dateArr[0]
        }else{
            SelectedDate.text = donor.birthDate
        }
        
        SelectedDate.userInteractionEnabled = false
        if Validator().verifyUrl(donor.img)
        {
            let url:NSURL = NSURL(string: donor.img)!
            self.img.sd_setImageWithURL(url, placeholderImage: UIImage(named: "avatar"))
        }
        
        // language
        
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
