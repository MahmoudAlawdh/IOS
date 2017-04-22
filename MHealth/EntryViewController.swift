

import UIKit
import VideoSplashKit
class EntryViewController: VideoSplashViewController {

    
    @IBAction func ArabicButton(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue("ar", forKey: "lang" )
        NSUserDefaults.standardUserDefaults().setValue("ar", forKey: Const.UserDefaultsKeys.langKey)
        NSUserDefaults.standardUserDefaults().setObject(["ar"], forKey: "AppleLanguages")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
     
    }
    
    @IBAction func EnglishButton(sender: AnyObject) {

        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue("en", forKey: "lang" )
        NSUserDefaults.standardUserDefaults().setValue("en", forKey: Const.UserDefaultsKeys.langKey)
        NSUserDefaults.standardUserDefaults().setObject(["en"], forKey: "AppleLanguages")
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("final", ofType: "mp4")!)
        self.videoFrame = view.frame
        self.fillMode = .ResizeAspectFill
        self.alwaysRepeat = true
        self.sound = true
        self.startTime = 0.0
        self.duration = 13.0
        self.alpha = 1.0
        self.backgroundColor = UIColor.clearColor()
        self.contentURL = url
        self.restartForeground = true
      
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
