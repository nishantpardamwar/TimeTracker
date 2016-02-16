//
//  ProjectListViewController.swift
//  TimeTracker
//
//  Created by vinay vivek katdare on 13/02/16.
//  Copyright © 2016 vinay vivek katdare. All rights reserved.
//

import UIKit

class ProjectListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var projectListTableView: UITableView!
    
    let list = ["nish","nikh","rahuldklshvshvghsiuvhijosvhikoshvjksgvsvhjsfnjvgsvjgdfpsbvisudvjkdgsviudnshjvgvbdsui"]

    override func viewDidLoad() {
        super.viewDidLoad()
        projectListTableView.dataSource = self
        projectListTableView.delegate = self
    }

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("projectListIemCell") as? ProjectListTableViewCell{
                cell.configCell("\(indexPath.row)", name: list[indexPath.row])
                return cell
        }else{
            return ProjectListTableViewCell()
        }
    }
    
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().removeObjectForKey("token")
        NSUserDefaults.standardUserDefaults().synchronize()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    

}
