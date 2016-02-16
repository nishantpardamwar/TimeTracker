//
//  ViewController.swift
//  TimeTracker
//
//  Created by vinay vivek katdare on 13/02/16.
//  Copyright © 2016 vinay vivek katdare. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginStackView: UIStackView!
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if let token = NSUserDefaults.standardUserDefaults().valueForKey("token") as? String{
            print("already logged in")
            TOKEN = token
            loadHomeScreen()
        }else{
            makeloginVisible(false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
    func loadHomeScreen(){
        print("loading home screen")
        self.performSegueWithIdentifier("onLoginSuccess", sender: nil)
    }
    
    @IBAction func onLoginButtonPressed(sender: AnyObject) {
        
        if username.text != "" && password.text != ""{
            if let username = username.text, let password = password.text {
                let params : [String:AnyObject] = 	[
                                                        "username":username,
                                                        "password":password
                                                    ]
        
                Alamofire.request(.POST, LOGIN_URL, parameters: params, encoding: .JSON).responseJSON {response in
                    print(response.result.value)
                    if let responseData = response.result.value {
                        self.verifyLoginDetails(responseData)
                    }else{
                        self.makeErrorDialog("Connection Error", message: "Failed to connect.")
                    }
                }
            }else{
                self.makeErrorDialog("Error", message: "Username or password fields cannot be empty")
            }
            
        }else{
            self.makeErrorDialog("Error", message: "Username or password cannot be empty")
        }

    }
    
    
    
    
    func verifyLoginDetails(json : AnyObject){
        if let jsonStr = json as? Dictionary<String,AnyObject>{
            if let token = jsonStr["token"] as? String{
                NSUserDefaults.standardUserDefaults().setValue(token, forKey: "token")
                NSUserDefaults.standardUserDefaults().synchronize()
                loadHomeScreen()
            }else{
                self.makeErrorDialog("Verification failed", message: "Wrong username or password")
            }
        }
    }
    
    
    func makeErrorDialog(title: String, message: String){
        let refreshAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
        }))
        
        self.presentViewController(refreshAlert, animated: true, completion: nil)
    }
    
    func makeloginVisible(hidden : Bool ){
        loginStackView.hidden = hidden
    }
    
}

