//
//  ShareViewController.swift
//  MHealth
//
//  Created by trn2 on 4/9/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet var lableText: UILabel!
    @IBAction func Share(sender: AnyObject) {
        
        let activityAC = UIActivityViewController(activityItems: [lableText.text!], applicationActivities: nil)
       activityAC.popoverPresentationController?.sourceView = self.view
       
        self.presentViewController(activityAC, animated: true, completion: nil)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
