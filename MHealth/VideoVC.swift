//
//  VideoVC.swift
//  MHealth
//
//  Created by trn1 on 4/20/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoVC: UIViewController {
    @IBAction func DoneAction(sender: AnyObject) {
        
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet var Done: UIButton!
  
    
    var playerVC = AVPlayerViewController()
    var playerView = AVPlayer()
    
    
    @IBOutlet var VideoThreeOut: UIButton!
    
    @IBAction func VideoOneAction(sender: AnyObject) {
       
       playerVC.supportedInterfaceOrientations()

        let fileURL = NSURL(fileURLWithPath: "/Users/trn1/Desktop/MHealth/MHealth/movie3.mp4")
        playerView = AVPlayer(URL: fileURL)
        
        playerVC.player = playerView
        self.presentViewController(playerVC, animated: true){
            self.playerVC.player?.play()
        }
        
    }
    
    
    @IBAction func VideoTwoAction(sender: AnyObject) {
        let fileURL = NSURL(fileURLWithPath: "/Users/trn1/Desktop/MHealth/MHealth/movie2.mp4")
        playerView = AVPlayer(URL: fileURL)
        
        playerVC.player = playerView
        self.presentViewController(playerVC, animated: true){
            self.playerVC.player?.play()
        }
        
        
    }
  
    @IBAction func VIdeoThree(sender: AnyObject) {
        let fileURL = NSURL(fileURLWithPath: "/Users/trn1/Desktop/MHealth/MHealth/movie1.mp4")
        playerView = AVPlayer(URL: fileURL)
        
        playerVC.player = playerView
        self.presentViewController(playerVC, animated: true){
            self.playerVC.player?.play()
        }
       
    }
    @IBOutlet var VideoTwo: UIButton!
    @IBOutlet var videoOne: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainColor: UIColor = UIColor ( red: CGFloat(191/255.0), green: CGFloat(32/255.0), blue: CGFloat(47/255.0), alpha: CGFloat(1.0))
        VideoThreeOut.layer.borderWidth = 2.0
        VideoThreeOut.layer.masksToBounds = true
        VideoThreeOut.layer.borderColor = mainColor.CGColor
       
        VideoTwo.layer.borderWidth = 2.0
        VideoTwo.layer.masksToBounds = true
        VideoTwo.layer.borderColor = mainColor.CGColor
        
        videoOne.layer.borderWidth = 2.0
        videoOne.layer.masksToBounds = true
        videoOne.layer.borderColor = mainColor.CGColor

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
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
