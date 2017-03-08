//
//  FogetPassViewController.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class FogetPassViewController: UIViewController , NetworkCaller{
    
//    
//    let successMessage = “Email message was sent to you at ”
//    self.displayMessage(successMessage)
    // return

    @IBOutlet weak var email: UITextField!
    
    
    @IBAction func confirm(sender: AnyObject) {
        
        
        let Donoremail:String = email.text!
        let networkManager:Networking = Networking()
        //networkManager.logging = true
        
        networkManager.AMJSONDictionary("http://34.196.107.188:8080/mHealthWS/ws/donor/reset/"+Donoremail, httpMethod: "GET" , jsonData:["email": Donoremail] , reqId: 5, caller: self)

    }



func setArrayResponse(resp: NSArray, reqId: Int) {
}

func setDictResponse(resp: NSDictionary, reqId: Int) {
    if resp == [:] {
        
        //lblMsg.text = " Success: An email was sent to you  "
        
    } else {

    //lblMsd.text = " wrong email"
    
    }
    
    
    
    
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
