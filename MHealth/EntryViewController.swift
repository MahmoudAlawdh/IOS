//
//  EntryViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit
import VideoSplashKit
class EntryViewController: VideoSplashViewController {

    
    @IBAction func ArabicButton(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue("ar", forKey: "lang" )
        
        
        
        
        userDefaults.valueForKey("lang")
    }
    
    @IBAction func EnglishButton(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue("en", forKey: "lang")
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("giphy", ofType: "mp4")!)
        self.videoFrame = view.frame
        self.fillMode = .ResizeAspectFill
        self.alwaysRepeat = true
        self.sound = true
        self.startTime = 12.0
        self.duration = 4.0
        self.alpha = 0.7
        self.backgroundColor = UIColor.blackColor()
        self.contentURL = url
        self.restartForeground = true
      
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
