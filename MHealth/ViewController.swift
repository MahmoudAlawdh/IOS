//
//  ViewController.swift
//  MHealth
//
//  Created by Ahmed on 3/4/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit
import Whisper

class ViewController: UIViewController, NetworkCaller {

    override func viewDidLoad() {
        super.viewDidLoad()
        let reach = Reach()
        if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
            let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
            Whisper(message, to: self.navigationController!,action:.Show)
            
        }else{
        Networking().AMJSONArray(Const.URLs.EditStatus,
                                 httpMethod: "PUT",
                                 jsonData: ["donationId":1,"status":"iOS Again !!"],
                                 reqId: 1, caller: self)
        }
    }
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
        print("Get array resp")
    }

    func setDictResponse(resp: NSDictionary, reqId: Int) {
        print("Get dict resp")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

