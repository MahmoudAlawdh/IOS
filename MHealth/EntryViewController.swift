

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
        
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("transtion2", ofType: "mp4")!)
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
