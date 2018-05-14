//
//  mytablecell.swift
//  CoreDataAllOperationwithPROTOCOL&DELEGATEPassingdata
//
//  Created by nikhil boriwale on 5/11/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import UIKit

class mytablecell: UITableViewCell {
    @IBOutlet weak var lblmobilenumber: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblcity: UILabel!
    @IBOutlet weak var lbladdress: UILabel!
    
    //Computed Properties use
    
    var  student:Student!{
        didSet{
            lblname.text = student.name
            lbladdress.text = student.address
            lblcity.text = student.city
            lblmobilenumber.text = student.mobile
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
