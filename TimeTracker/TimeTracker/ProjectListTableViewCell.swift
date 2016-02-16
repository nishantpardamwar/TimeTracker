//
//  ProjectListTableViewCell.swift
//  TimeTracker
//
//  Created by vinay vivek katdare on 16/02/16.
//  Copyright © 2016 vinay vivek katdare. All rights reserved.
//

import UIKit

class ProjectListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var number : UILabel?

    @IBOutlet weak var projectName : UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 6.0
        self.clipsToBounds = true
    }
    
    func configCell(number : String, name: String){
        self.number?.text = number
        self.projectName?.text = name
    }
}
