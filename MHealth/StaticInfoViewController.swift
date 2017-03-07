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
    
    @IBOutlet var Questions: UIButton!

    @IBOutlet var BloodSafety: UIButton!

    @IBAction func DonationProcess(sender: AnyObject) {
        
        let c:UINavigationController = (self.storyboard?.instantiateViewControllerWithIdentifier("DP")) as! UINavigationController
        
        self.presentViewController(c, animated: false, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
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
