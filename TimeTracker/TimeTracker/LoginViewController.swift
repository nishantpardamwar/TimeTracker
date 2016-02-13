//
//  ViewController.swift
//  TimeTracker
//
//  Created by vinay vivek katdare on 13/02/16.
//  Copyright © 2016 vinay vivek katdare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loadHomeScreen(sender : UIButton){
        
        
        performSegueWithIdentifier("onLoginSuccess", sender: nil)
        
    }
        
}

