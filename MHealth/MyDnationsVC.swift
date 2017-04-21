//
//  MyDnationsVC.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit
import Whisper


class MyDnationsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkCaller {
 
    @IBOutlet weak var oldTable: UITableView!
    
    @IBOutlet weak var upcomingTable: UITableView!
    var mainColor: UIColor = UIColor ( red: CGFloat(255/255.0), green: CGFloat(186/255.0), blue: CGFloat(186/255.0), alpha: CGFloat(1.0))

    var myDonation = [" Donation Time", " Donation Time "]
    var networkManager : Networking = Networking()
    
    var donationTime : NSArray = NSArray()
    var oldTableArray : NSMutableArray = NSMutableArray()
    var upcomingTableArray : NSMutableArray = NSMutableArray()
    
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
        print(resp)
        donationTime = resp
        
    }
    
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let reach = Reach()
        if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
            let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: mainColor, images: nil)
            Whisper(message, to: self.navigationController!,action:.Show)
            
        }else{
        networkManager.AMGetArrayData(Const.URLs.donationRecord + "/civilId" , params: ["donorCivilid": 23], reqId: 1, caller: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
            return 1
        
        
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableView.tag == 1 {
            
        return oldTableArray.count
        }
        else {
            return upcomingTableArray.count
        }
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        // Configure the cell...
        let cell = UITableViewCell()
        if tableView.tag == 1 {
            
            cell.textLabel!.text = "Donation Time"

        }else
        {
         
            cell.textLabel!.text = "Donation Time"

        }
        
        
        return cell
    }
    
    
     func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView.tag == 1{
            return  "My Donations "
        }
        else {
            return "Upcoming Appointment"
        }
        
    }
   
}
