//
//  ViewController.swift
//  CoreDataAllOperationwithPROTOCOL&DELEGATEPassingdata
//
//  Created by nikhil boriwale on 5/11/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import UIKit

class ViewController: UIViewController,datapass {
   
    

    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtaddress: UITextField!
    @IBOutlet weak var txtcity: UITextField!
    @IBOutlet weak var txtmobile: UITextField!
    var i = Int()
    var isUpdate = Bool()
    @IBAction func btnactionaSave(_ sender: Any) {
        let dict = ["name":txtname.text,"address":txtaddress.text,"city":txtcity.text,"mobile":txtmobile.text]
        if isUpdate{
            Databasehelper.sharedmanager.EditData(object: dict as! [String : String], i: i)
        }else{
        
        Databasehelper.sharedmanager.save(object: dict as! [String : String])
        }
        
    }
    @IBAction func btnshowdata(_ sender: Any) {
    let move = self.storyboard?.instantiateViewController(withIdentifier: "secondVCr")as! secondVCr
        move.deleget = self
        self.navigationController?.pushViewController(move, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   func data(object:[String:String],SelectedRowIndexChanges:Int,isEdit: Bool) {
        txtname.text = object["name"]
        txtaddress.text = object["address"]
        txtcity.text = object["city"]
     txtmobile.text = object["mobile"]
        i = SelectedRowIndexChanges
    isUpdate = isEdit
    }


}

