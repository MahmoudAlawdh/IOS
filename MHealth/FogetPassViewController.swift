//
//  FogetPassViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class FogetPassViewController: UIViewController {

    @IBOutlet var email: UILabel!
    
    @IBOutlet var confirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let userDefaults = NSUserDefaults.standardUserDefaults()
        var langu:String = userDefaults.valueForKey("lang") as! String
        
        
        if langu == "ar" {
            email.text = "البريد الالكتروني"
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
