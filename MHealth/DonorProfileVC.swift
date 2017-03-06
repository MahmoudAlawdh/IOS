//
//  DonorProfileVC.swift
//  MHealth
//
//  Created by trn2 on 3/5/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class DonorProfileVC: UIViewController {
    @IBOutlet var NameField: UITextField!
    @IBOutlet var LNameField: UITextField!
    @IBOutlet var EmailField: UITextField!

    @IBOutlet var passwordField: UITextField!
    @IBOutlet var Phone: UITextField!
    @IBOutlet var BloodTypeField: UITextField!
    @IBOutlet var NationalityField: UITextField!
    @IBOutlet var BirthDate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        NameField.text = donor.firstName
        LNameField.text = donor.lastName
        EmailField.text = donor.email
        passwordField.text = donor.password
        Phone.text = donor.phoneNumber
        BloodTypeField.text = donor.bloodtype
        NationalityField.text = donor.nationality
        BirthDate.text = donor.birthDate
        

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
