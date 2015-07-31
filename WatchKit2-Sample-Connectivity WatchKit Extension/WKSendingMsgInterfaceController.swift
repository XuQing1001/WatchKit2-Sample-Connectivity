//
//  WKSendingMsgInterfaceController.swift
//  WatchKit2-Sample-Connectivity
//
//  Created by XuQing on 15/7/19.
//  Copyright © 2015年 XuQing1001. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class WKSendingMsgInterfaceController: WKInterfaceController, WCSessionDelegate {
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // 在Watch和iPhone端都需要激活一个Session
        if (WCSession.isSupported()) {                  // 1. 检测是否支持WCSession
            let session = WCSession.defaultSession()    // 2. 获取Session对象
            session.delegate = self                     // 3. 绑定为Session的代理对象
            session.activateSession()                   // 4. 激活Session
        }
    }

    // WCSessionDelegate协议的函数， 收到消息时被触发
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        print("收到消息：")
        let defaultAction = WKAlertAction(
            title: "关闭",
            style: WKAlertActionStyle.Default) { () -> Void in
        }
        // 弹出Alert窗口，显示收到的消息
        self.presentAlertControllerWithTitle(
            "收到来自iPhone的消息:",
            message: message["问候"] as? String,
            preferredStyle: WKAlertControllerStyle.Alert,
            actions: [defaultAction])
    }

    // Action：关联按钮[发送消息给iPhone]
    @IBAction func sendMsgToIPhoneBtnTapped() {
        print("正在发送消息给iPhone..")
        let message = ["问候": "你好iPhone，我是Apple Watch。"]
        WCSession.defaultSession().sendMessage(
            message, replyHandler: { (replyMessage) -> Void in
                // 异常处理
            }) { (error) -> Void in
                print(error.localizedDescription)
        }
    }
}
