//
//  Campaigns.swift
//  MHealth
//
//  Created by trn24 on 4/13/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//


import UIKit
import Whisper
import SwiftSpinner

class TableCampaignVC: UITableViewController, NetworkCaller {
    
    
    
    func loadData(){
        let obj:Reach = Reach()
        if obj.connectionStatus().description != ReachabilityStatus.Offline.description{
            print("loadData")
            SwiftSpinner.show(NSLocalizedString("Loading...", comment: ""))
            let url:String = "http://34.196.107.188:8081/MhealthWeb/webresources/callfordonation"
            let networkManager:Networking = Networking()
            networkManager.AMGetArrayData(url, params: [:], reqId: 0, caller: self)
        
        } else {
            
            let message = Message(title: "No Internet Connection", textColor: UIColor.whiteColor() , backgroundColor: UIColor.redColor(), images: nil)
            Whisper(message, to: self.navigationController!, action: .Show)
            Silent(self.navigationController!, after: 3.0)
        }
        
        
    }
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
        
//         loop on resp .. get each dictionary .. convert to object .. add to list manager
        ListManager.list.CampList.removeAllObjects()
        for item in resp {
            print(item)
            let dictItem = item as! NSDictionary
            let newCamp:Campaign = Campaign()
            newCamp.loadDictionary(dictItem)
            ListManager.list.CampList.addObject(newCamp)
            
            
        }
        self.tableView.reloadData()
        SwiftSpinner.hide()
        
    }
    
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        SwiftSpinner.hide()
        
        print("deleted")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
       //  self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        loadData()
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
        return ListManager.list.CampList.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //       let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        //         Configure the cell...
        
        let cell:UITableViewCell = UITableViewCell()
        let currentItem = ListManager.list.CampList.objectAtIndex(indexPath.row)
        let currentCamp:Campaign = currentItem as! Campaign
        cell.textLabel?.text = currentCamp.name   //we dont have campaign name
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let nextScreen:ViewCampaign = self.storyboard?.instantiateViewControllerWithIdentifier("Campaigns") as! ViewCampaign
        
        nextScreen.currentIndex = indexPath.row
        
        //
        
        //let koko:Campaigns = Campaigns()
        nextScreen.currentCamp = ListManager.list.CampList.objectAtIndex(indexPath.row) as! Campaign
        
        //navigation
        let navCon:UINavigationController = self.navigationController!
        navCon.pushViewController(nextScreen, animated: true)
        
        
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
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