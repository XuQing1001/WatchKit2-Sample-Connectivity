//
//  AppDelegate.swift
//  WatchKit2-Sample-Connectivity
//
//  Created by XuQing on 15/7/19.
//  Copyright © 2015年 XuQing1001. All rights reserved.
//

import UIKit
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let settings = UIUserNotificationSettings(
            forTypes: [.Badge, .Sound, .Alert],
            categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        
        // 在Watch和iPhone端都需要激活一个Session
        if (WCSession.isSupported()) {                  // 1. 检测是否支持WCSession
            let session = WCSession.defaultSession()    // 2. 获取Session对象
            session.delegate = self                     // 3. 绑定为Session的代理对象
            session.activateSession()                   // 4. 激活Session
        }
        
        return true
    }
    
    // WCSessionDelegate协议的函数，收到消息时被触发
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        let localNotification = UILocalNotification()
        localNotification.alertBody = message["问候"] as? String
        localNotification.fireDate = NSDate()
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
}

