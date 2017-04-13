//
//  ViewCampaigns.swift
//  MHealth
//
//  Created by trn24 on 4/13/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

import MapKit
import CoreLocation
import Whisper
import SwiftSpinner

class ViewCampaign: UIViewController, NetworkCaller, MKMapViewDelegate {
    
    @IBOutlet weak var LocationName: UILabel!
    @IBOutlet weak var Map: MKMapView!
    
    @IBOutlet weak var StartDate: UILabel!
    
    @IBOutlet weak var EndDate: UILabel!
    
    @IBOutlet weak var BloodType: UILabel!
    
    
    @IBOutlet weak var Name: UILabel!
    var currentCamp:Campaign = Campaign()
    var listDonorsID:[Int] = []
    var stat:String = ""
    var currentIndex = 0
    var llong:Double = 0.0
    var llat:Double = 0.0


    @IBAction func btnEdit(sender: AnyObject) {

        
    }
    
    @IBAction func btnSave(sender: AnyObject) {
        
//        var Camp:Campaign = self.currentCamp
//        
//        Camp.setValue(txtCampName.text, forKey: "name")
//        Camp.setValue(txtStartDate.text, forKey: "startdate")
//        Camp.setValue(txtEndDate.text, forKey: "enddate")
//        Camp.setValue(txtTypesNeeded.text, forKey: "bloodTypes")
//        Camp.setValue(txtLocation.text, forKey: "locationName")
//        Camp.setValue(String(llat) , forKey: "LLat")
//        Camp.setValue(String(llong), forKey: "LLong")
//        Camp.setValue(currentCamp.CFDId, forKey: "CFDId")
//        
//        if segStatusOutlet.selectedSegmentIndex == 0 {
//            Camp.setValue("Active", forKey: "status")
//        }
//        else {
//            Camp.setValue("Inactive", forKey: "status")
//        }
//        
//        
//        let id = Camp.valueForKey("CFDId") as! Int
//        let networkManager:Networking = Networking()
//        let url = Const.URLs.campaign+"/"+String(id)
//        
//        var obj:Reach = Reach()
//        if obj.connectionStatus().description != ReachabilityStatus.Offline.description{
//            
//            SwiftSpinner.show(NSLocalizedString("Loading...", comment: ""))
//            networkManager.AMJSONDictionary(url , httpMethod: "PUT", jsonData: Camp.toDictionary(), reqId: 0, caller: self)
//            
//            
//        } else {
//            
//            let message = Message(title: "No Internet Connection", textColor: UIColor.whiteColor() , backgroundColor: UIColor.redColor(), images: nil)
//            Whisper(message, to: self.navigationController!, action: .Show)
//            Silent(self.navigationController!, after: 3.0)
//        }
        
    }
    
    func setArrayResponse(resp: NSArray, reqId: Int) {
        
        switch reqId {
        case 0:
            
            if resp == []{
//                lblResult.text = "Campaign updated"
            }
            else{
//                lblResult.text = "Error: Try again"
            }
//            SwiftSpinner.hide()
            break
            
        case 2:
            for item in resp {
                listDonorsID.append(item.valueForKey("donorId") as! Int)
                
            }
//            SwiftSpinner.hide()
//            txtNumDonation.text = String(listDonorsID.count)
            break
        default:
            break
        }
        
//        SwiftSpinner.hide()
        
    }
    
    func setDictResponse(resp: NSDictionary, reqId: Int) {
        print("hola!")
        
        
        if resp == []{
//            lblResult.text = "Campaign updated"
        }
        else{
//            lblResult.text = "Error: Try again"
        }
//        SwiftSpinner.hide()
        
        
    }
    
    func loadDonors() {
        let obj:Reach = Reach()
        if obj.connectionStatus().description != ReachabilityStatus.Offline.description{
            
//            SwiftSpinner.show(NSLocalizedString("Loading...", comment: ""))
//            Networking().AMGetArrayData(Const.URLs.campaignReg+"/campaign/"+String(currentCamp.CFDId), params: [:], reqId: 2, caller: self)
            
            
        } else {
            
            let message = Message(title: "No Internet Connection", textColor: UIColor.whiteColor() , backgroundColor: UIColor.redColor(), images: nil)
            Whisper(message, to: self.navigationController!, action: .Show)
            Silent(self.navigationController!, after: 3.0)
        }
    }
    
    
    @IBAction func btnViewDonors(sender: AnyObject) {
        
//        let nextScreen:DonorsListTVC = self.storyboard?.instantiateViewControllerWithIdentifier("DonorsList") as! DonorsListTVC
////        
//        nextScreen.listDonorsID = self.listDonorsID
//        
//        
//        let navCon:UINavigationController = self.navigationController!
//        
//        navCon.pushViewController(nextScreen, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        LocationName.text = "Sh"
      StartDate.text = currentCamp.startdate
      EndDate.text = currentCamp.enddate
//        txtNumDonation.text = "0"
        LocationName.text = currentCamp.locationName
       BloodType.text = currentCamp.bloodTypes
//
//
        Name.text = currentCamp.name
        Name.userInteractionEnabled = false
        StartDate.userInteractionEnabled = false
        EndDate.userInteractionEnabled = false
        //txtNumDonation.userInteractionEnabled = false
        LocationName.userInteractionEnabled = false
        BloodType.userInteractionEnabled = false
        //egStatusOutlet.userInteractionEnabled = false

        loadDonors()
        
        
        //MAAAAP S
        Map.delegate = self
        var lllong:Double = Double(currentCamp.LLong)!
        var lllat:Double = Double(currentCamp.LLat)!
        
        var location = CLLocationCoordinate2DMake(lllat, lllong)
        
        var span = MKCoordinateSpanMake(0.04, 0.04)
        var region = MKCoordinateRegion(center: location, span: span)
        
        Map.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = currentCamp.locationName
        
        Map.addAnnotation(annotation)
        
        //MAAAAP F
        
    }
    
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        // Remove all annotations
        self.Map.removeAnnotations(mapView.annotations)
        
        // Add new annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = mapView.centerCoordinate
        annotation.title = "title"
        annotation.subtitle = "subtitle"
        self.Map.addAnnotation(annotation)
        llat = annotation.coordinate.latitude
        llong = annotation.coordinate.longitude
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {

    }
}
