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
    
    
    
    
    
    
    
    @IBOutlet var can2: UITextView!
    @IBOutlet var can1: UITextView!
    @IBOutlet var After7: UITextView!
    @IBOutlet var After6: UITextView!
    @IBOutlet var After5: UITextView!
    @IBOutlet var After4: UITextView!
    @IBOutlet var After3: UITextView!
    @IBOutlet var After2: UITextView!
    @IBOutlet var After1: UITextView!
    @IBOutlet var before3: UITextView!
    @IBOutlet var before2: UITextView!
    @IBOutlet var before1: UITextView!
    @IBOutlet var Procee3: UITextView!
    @IBOutlet var Procee2: UITextView!
    @IBOutlet var Procee1: UITextView!
    @IBAction func Done(sender: AnyObject) {
                self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        
    }

}
