//
//  DoneController.swift
//  MHealth
//
//  Created by trn1 on 3/7/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class DoneController: UIViewController {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet var Procee1: UITextView!
    @IBAction func Done(sender: AnyObject) {
                self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        //Procee1.text
    }

}
