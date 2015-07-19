//
//  ViewController.swift
//  WatchKit2-Sample-Connectivity
//
//  Created by XuQing on 15/7/19.
//  Copyright © 2015年 XuQing1001. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // =========================================================================
    // MARK: - Actions
    
    @IBAction func sendToWatchBtnTapped(sender: UIButton!) {
        
        // check the reachablity
        if WCSession.defaultSession().reachable == false {
            
            let alert = UIAlertController(
                title: "Failed to send",
                message: "Apple Watch is not reachable.",
                preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            
            return
        }
        
        let message = ["request": "showAlert"]
        WCSession.defaultSession().sendMessage(
            message, replyHandler: { (replyMessage) -> Void in
                //
            }) { (error) -> Void in
                print(error.localizedDescription)
        }
    }

}

