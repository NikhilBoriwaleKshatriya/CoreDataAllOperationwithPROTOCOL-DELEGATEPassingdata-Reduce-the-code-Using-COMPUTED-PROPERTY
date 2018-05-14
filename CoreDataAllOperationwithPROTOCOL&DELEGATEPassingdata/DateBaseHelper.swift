//
//  DateBaseHelper.swift
//  CoreDataAllOperationwithPROTOCOL&DELEGATEPassingdata
//
//  Created by nikhil boriwale on 5/11/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Databasehelper {
 
    //create singleton class 
    static var sharedmanager = Databasehelper()
     let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    //Save data 
    
    func save(object:[String:String]){
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        student.name = object["name"]
        student.address = object["address"]
        student.mobile = object["mobile"]
        student.city = object["city"]
        do{
            try context?.save()
        }catch{
            print("data is not save")
        }
    }
    
    
    // GEt data
    
    func getstudentdata() ->[Student]{
        var student = [Student]()
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"Student")
        do{
        student = try context?.fetch(fetchRequest) as! [Student]
        }catch{
            print(" can not get data")
        }
        return student
    }
    
    
    //Delete Data
    func deletedata(index:Int) ->[Student]{
        var mystudent = getstudentdata()
        context?.delete(mystudent[index])
        mystudent.remove(at:index)
        do{
            try context?.save()
        }catch{
            print("cannot delete data")
        }
        return mystudent
    }
    
     // Edit data
    func EditData(object:[String:String], i: Int)  {
        var editstudent = getstudentdata()
        editstudent[i].name = object["name"]
        editstudent[i].address = object["address"]
        editstudent[i].city = object["city"]
        editstudent[i].mobile = object["mobile"]
        do{
            try context?.save()
        }catch{
            print("data is not edit")
        }
    }
    
    
    
    
    
    
    
    
    
}
//agr dta dabase may save hua hey ki nahi wo check krne key liye hme appdelegt may ek line print krni pdegi ..other wise khega data not found
