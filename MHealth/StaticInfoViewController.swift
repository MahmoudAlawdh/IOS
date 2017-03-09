//
//  StaticInfoViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class StaticInfoViewController: UIViewController {
    

    @IBOutlet var DonProcess: UIButton!
    
    @IBOutlet var CanDon: UIButton!
    
    @IBOutlet var BeforDon: UIButton!
    
    @IBOutlet var AfterDon: UIButton!
    

    @IBAction func DonationProcess(sender: AnyObject) {
        
        let c:UINavigationController = (self.storyboard?.instantiateViewControllerWithIdentifier("DP")) as! UINavigationController
        
        self.presentViewController(c, animated: false, completion: nil)
        
    }
    
    @IBAction func BeforeDonation(sender: AnyObject) {
        let c:UINavigationController = (self.storyboard?.instantiateViewControllerWithIdentifier("BD")) as! UINavigationController
        
        self.presentViewController(c, animated: false, completion: nil)
        
    }
    
    
    @IBAction func CanIDonate(sender: AnyObject) {
        let c:UINavigationController = (self.storyboard?.instantiateViewControllerWithIdentifier("CID")) as! UINavigationController
        
        self.presentViewController(c, animated: false, completion: nil)
    }

    
    @IBAction func AfterDonation(sender: AnyObject) {
        let c:UINavigationController = (self.storyboard?.instantiateViewControllerWithIdentifier("AF")) as! UINavigationController
        
        self.presentViewController(c, animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let langu:String = userDefaults.valueForKey("lang") as! String
        
        
        if langu == "ar" {
            self.title = "معلومات"
            self.tabBarController?.viewControllers?[1].title = "حجز"
            self.tabBarController?.viewControllers?[2].title = "tbr3ati"
            self.tabBarController?.viewControllers?[3].title = "الملف الشخصي"
            DonProcess.setTitle("عملية التبرع", forState: .Normal)
            
            CanDon.setTitle("هل استطيع التبرع ؟", forState: .Normal)
            BeforDon.setTitle("قبل التبرع", forState: .Normal)
            AfterDon.setTitle("بعد التبرع", forState: .Normal)
        }
        else {
            DonProcess.setTitle("Donation Process", forState: .Normal)
            
            CanDon.setTitle("Can i Donate!", forState: .Normal)
            BeforDon.setTitle("Befor Donation", forState: .Normal)
            AfterDon.setTitle("Aftere Donation", forState: .Normal)
            
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
