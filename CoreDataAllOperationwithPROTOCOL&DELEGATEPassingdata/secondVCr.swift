//
//  secondVCr.swift
//  CoreDataAllOperationwithPROTOCOL&DELEGATEPassingdata
//
//  Created by nikhil boriwale on 5/11/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import UIKit
protocol datapass {
    func data(object:[String:String],SelectedRowIndexChanges:Int,isEdit: Bool)
    //object:[String:String] = data Pass krnya sathi ghetal
    //SelectedRowIndexChanges:Int = user ne konta Row select kela ahe to row tyla edit or delete kraych asel tr smjnar.
    //isEdit: Bool = after data edit comiler kosmjna chaiye ki data jo usane  change kiya hey ya nahi agr kiya hey to bool value true ho jayegi.
    
    
}

class secondVCr: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var mytable: UITableView!
   
 var student = [Student]()
    
    var deleget:datapass!
    override func viewDidLoad() {
        super.viewDidLoad()
    student = Databasehelper.sharedmanager.getstudentdata()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tablecell : mytablecell = tableView.dequeueReusableCell(withIdentifier: "mytablecell") as! mytablecell
        
        //REGULAR WAY
//        tablecell.lblname.text = student[indexPath.row].name
//        tablecell.lbladdress.text = student[indexPath.row].address
//        tablecell.lblcity.text = student[indexPath.row].city
//        tablecell.lblmobilenumber.text = student[indexPath.row].mobile
        
        
        // TO REDUCE THE CODE use computed properties using did set method
        
        tablecell.student = student[indexPath.row]
        
        return tablecell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dict = ["name":student[indexPath.row].name,"address":student[indexPath.row].address,"city":student[indexPath.row].city,"mobile":student[indexPath.row].mobile]
        // passing index & dict value & check data edit or not using bool value
        deleget.data(object: dict as! [String : String],SelectedRowIndexChanges: indexPath.row, isEdit: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       return true
       
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            student = Databasehelper.sharedmanager.deletedata(index: indexPath.row)
            self.mytable.deleteRows(at: [indexPath], with: .automatic)
        }
        
        
    }
    
    
    
    

}
