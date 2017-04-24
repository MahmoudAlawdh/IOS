//
//  UpcomingTableVC.swift
//  MHealth
//
//  Created by trn24 on 4/10/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//
import SwiftSpinner
import UIKit

class UpcomingTableVC: UITableViewController , NetworkCaller {
    
    
//    @IBOutlet weak var UpcomingTableView: UITableView!
    
    var networkManager : Networking = Networking()
    
    var donationTime : NSArray = NSArray()
    var upcomingTableArray : NSMutableArray = NSMutableArray()
    var data:NSMutableArray = NSMutableArray()
    
    var flag = false;
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        SwiftSpinner.hide()
         //Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
       // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        networkManager.AMGetArrayData(Const.URLs.DonationRecord, params: [:], reqId: 1, caller: self)
        
//        UpcomingTableView.delegate = self
//        UpcomingTableView.dataSource = self
        
        
    }
    
    
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        
        
    }
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
        flag = true
        
        
        for item in resp{
            SwiftSpinner.show("loading..").addTapHandler({
                SwiftSpinner.hide()
                }, subtitle: "Tap to hide while connecting! Click here please ")

            if item.valueForKey("status") as! String == "pending"{
               if item.valueForKey("donorCivilid") as! String == donor.civilID{
                    data.addObject(item)
               
             }
            }
        }
        self.tableView.reloadData()
            SwiftSpinner.hide()
    }
    
    
    
    // MARK: - Table view data source
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell:CustomeUpcomingTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("upcoming") as! CustomeUpcomingTableViewCell
        if flag == true {
            //SwiftSpinner.show(NSLocalizedString("Loading...", comment: ""))
            cell.UpcomingTableView.text = ""
            //cell.Date.text = data.objectAtIndex(indexPath.row).valueForKey("ddate") as! String
            
            
            let time:String = data.objectAtIndex(indexPath.row).valueForKey("ddate") as! String
            let timetemp:[String] = time.characters.split{$0 == "T"}.map(String.init)
            if timetemp.count == 2 {
                cell.Date.text = timetemp[0]
            }else{
                cell.Date.text = ""
            }
            
            cell.BloodType.text = data.objectAtIndex(indexPath.row).valueForKey("dnbloodtype") as! String
            cell.Destination.text = data.objectAtIndex(indexPath.row).valueForKey("donationdestination") as! String
        }
        
        
        
        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Upcoming Appointment"
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let cell:CustomeUpcomingTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("upcoming") as! CustomeUpcomingTableViewCell
        
        return cell.frame.size.height
    }
    
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


