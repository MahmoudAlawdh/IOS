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
        var mainColor: UIColor = UIColor ( red: CGFloat(191/255.0), green: CGFloat(32/255.0), blue: CGFloat(47/255.0), alpha: CGFloat(1.0))
        DonProcess.layer.borderWidth = 2.0
        DonProcess.layer.masksToBounds = true
        DonProcess.layer.borderColor = mainColor.CGColor
        
        
        AfterDon.layer.borderWidth = 2.0
        AfterDon.layer.masksToBounds = true
        AfterDon.layer.borderColor = mainColor.CGColor
        
        BeforDon.layer.borderWidth = 2.0
        BeforDon.layer.masksToBounds = true
        BeforDon.layer.borderColor = mainColor.CGColor
        
        CanDon.layer.borderWidth = 2.0
        CanDon.layer.masksToBounds = true
        CanDon.layer.borderColor = mainColor.CGColor

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
