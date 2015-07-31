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

    // Action: 关联按钮[发送消息给Watch]
    @IBAction func sendMsgToWatchBtnTapped(sender: UIButton!) {
        
        // 检查连接
        if WCSession.defaultSession().reachable == false {
            // 无法连接到Watch
            let alert = UIAlertController(
                title: "发送失败！",
                message: "无法连接到Watch。",
                preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            
            return
        }
        
        // 连接没问题，发送消息
        let message = ["问候": "你好Apple Watch，我是iPhone。"]
        WCSession.defaultSession().sendMessage(
            message,
            replyHandler: { (replyMessage) -> Void in
            // 异常处理
            }) { (error) -> Void in
                print(error.localizedDescription)
        }
    }

}

