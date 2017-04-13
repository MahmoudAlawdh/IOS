

import UIKit
import Whisper
class NotfcationVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkCaller{
    
    var networkManager : Networking = Networking()
    var data:NSArray = NSArray()
    var notifcation = ["zainab" , "shikha" , "Mahmoud"]
    var flag:Bool = false
    @IBOutlet var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let reach = Reach()
        if reach.connectionStatus().description == ReachabilityStatus.Offline.description{
            let message = Message(title: "No connection", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(), images: nil)
            Whisper(message, to: self.navigationController!,action:.Show)
            
        }else{
        networkManager.AMGetArrayData("http://34.196.107.188:8081/MhealthWeb/webresources/bbnotification", params: ["donorCivilid": 23], reqId: 1, caller: self)
       
        TableView.delegate = self
        TableView.dataSource = self
        
        }

        
    }
    
    func setDictResponse(resp: NSDictionary, reqId: Int) {
       

    }
    
    func setArrayResponse(resp: NSArray, reqId: Int) {

        
        flag =  true
        data = resp
        print(data)
        TableView.reloadData()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! CustomTVC
        cell.zainab = self
        
        if flag == true{
            let userDefaults = NSUserDefaults.standardUserDefaults()
            let langu:String = userDefaults.valueForKey("lang") as! String
            
            
            
                
           

        cell.titleText.text = data.objectAtIndex(indexPath.row).valueForKey("title") as! String
        cell.notifcationText.text = data.objectAtIndex(indexPath.row).valueForKey("date") as! String
        cell.descriptionText.text = data.objectAtIndex(indexPath.row).valueForKey("description") as! String
          
        }
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
     let cell = TableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomTVC
        return cell.frame.size.height
    }
    
  
    
    }
