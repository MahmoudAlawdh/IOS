//
//  MyPreviousDonation.swift
//  MHealth
//
//  Created by trn24 on 4/10/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class MyPreviousDonation: UITableViewController, NetworkCaller {
    
    var networkManager : Networking = Networking()
    
    var donationTime : NSArray = NSArray()
    var previousTableArray : NSMutableArray = NSMutableArray()
    var data:NSMutableArray = NSMutableArray()
    
    var flag = false;

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
         networkManager.AMGetArrayData("http://34.196.107.188:8081/MhealthWeb/webresources/donationrecord", params: [:], reqId: 1, caller: self)
    }
    
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        
        
    }
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
        flag = true
        for item in resp{
            if item.valueForKey("status") as! String == "accepted"{
                if item.valueForKey("donorCivilid") as! String == donor.civilID{
                    data.addObject(item)
                }
            }
        }
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:CustomePrevious = self.tableView.dequeueReusableCellWithIdentifier("previous") as! CustomePrevious
        if flag == true {
            cell.Donations.text = "Previous Donation"
            cell.Date.text = data.objectAtIndex(indexPath.row).valueForKey("ddate") as! String
            cell.BloodType.text = data.objectAtIndex(indexPath.row).valueForKey("dnbloodtype") as! String
            cell.destination.text = data.objectAtIndex(indexPath.row).valueForKey("donationdestination") as! String
        }
        
        
        
        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Previous Donations"
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let cell:CustomePrevious = self.tableView.dequeueReusableCellWithIdentifier("previous") as! CustomePrevious
        
        return cell.frame.size.height
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
