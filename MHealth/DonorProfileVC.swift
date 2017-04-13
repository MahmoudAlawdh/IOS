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

    @IBOutlet var img: UIImageView!
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

            
            
            
            
            
            
            
            
            
            
            
            

            let params:[String:AnyObject] = ["appID": "donor" , "imgData": strBase64]
            let networkManager: Networking = Networking()

            networkManager.AMPostDictData("http://34.196.107.188:8081/MhealthWeb/addimg", params: params, reqId: 0, caller: self)
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
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
            print(resp)
            print(reqId)
        if(reqId == 0)
        {
            print(resp.valueForKey("imgPath") as! String);
        donor.img =  resp.valueForKey("imgPath") as! String
            let n:Networking = Networking()
            var dit = [String: AnyObject]()
            
            dit["civilId"] = donor.civilID
            dit["firstName"] = donor.firstName
            dit["lastName"] = donor.lastName
            dit["password"] = donor.password
            dit["nationality"] = donor.nationality
            dit["email"] = donor.email
            dit["phoneNumber"] = donor.phoneNumber
            dit["gender"] = donor.gender
            dit["bloodType"] = donor.bloodtype
            dit["birthDate"] = "2017-01-01T00:00:00Z"
            dit["donorId"] = donor.donorID
            dit["imgURL"] = donor.img
            dit["status"] = true
            
            
            let reach = Reach()
            if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
                let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
                Whisper(message, to: self.navigationController!,action:.Show)
                
            }else{
                print(dit)
                n.AMJSONDictionary("http://34.196.107.188:8081/MhealthWeb/webresources/donor/" + "\(donor.donorID)", httpMethod: "PUT", jsonData: dit, reqId: 1, caller: self)
            }
        }
        if(reqId == 1){
            // update profile with database
            print(resp)

        }
        
        
    }
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
          //  print(resp)
        
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
    func loadImageFromUrl(url: String, view: UIImageView){
        
        // Create Url from string
        let url = NSURL(string: url)!
        
        // Download task:
        // - sharedSession = global NSURLCache, NSHTTPCookieStorage and NSURLCredentialStorage objects.
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (responseData, responseUrl, error) -> Void in
            // if responseData is not null...
            if let data = responseData{
                
                // execute in UI thread
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    view.image = UIImage(data: data)
                })
            }
        }
        
        // Run task
        task.resume()
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
        loadImageFromUrl(donor.img, view: img)
        
        
   
        
        
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
