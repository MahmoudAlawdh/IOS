//
//  SettingsVC.swift
//  MHealth
//
//  Created by trn2 on 4/11/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBAction func ArabicButton(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue("ar", forKey: "lang" )
        
        userDefaults.valueForKey("lang")
        
        
        //send alert to exit app
        let alertControlle:UIAlertController = UIAlertController(title: NSLocalizedString("Note", comment: ""), message: NSLocalizedString("To Apply Changes must restart the app", comment: ""), preferredStyle: .Alert)
        
        let action:UIAlertAction =  UIAlertAction(title: "Later", style: .Cancel, handler: { (UIAlertAction) in
            //                let loginVC:LoginVC = self.storyboard?.instantiateViewControllerWithIdentifier("LoginController") as! LoginVC
            //                self.navigationController?.pushViewController(loginVC, animated: true)
            self.navigationController?.popViewControllerAnimated(true)
            
        })
        
        let actionExit:UIAlertAction =  UIAlertAction(title: "Exit Now", style: .Destructive, handler: { (UIAlertAction) in
            exit(0)
        })
        
        alertControlle.addAction(action)
        alertControlle.addAction(actionExit)
        self.presentViewController(alertControlle, animated: true, completion: nil)
        
    }
    
    
    @IBAction func EnglishButton(sender: AnyObject) {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue("en", forKey: "lang")
        
        //send alert to exit app
        let alertControlle:UIAlertController = UIAlertController(title: NSLocalizedString("Note", comment: ""), message: NSLocalizedString("To Apply Changes must restart the app", comment: ""), preferredStyle: .Alert)
        
        let action:UIAlertAction =  UIAlertAction(title: "Later", style: .Cancel, handler: { (UIAlertAction) in
            //                let loginVC:LoginVC = self.storyboard?.instantiateViewControllerWithIdentifier("LoginController") as! LoginVC
            //                self.navigationController?.pushViewController(loginVC, animated: true)
            self.navigationController?.popViewControllerAnimated(true)
            
        })
        
        let actionExit:UIAlertAction =  UIAlertAction(title: "Exit Now", style: .Destructive, handler: { (UIAlertAction) in
            exit(0)
        })
        
        alertControlle.addAction(action)
        alertControlle.addAction(actionExit)
        self.presentViewController(alertControlle, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
