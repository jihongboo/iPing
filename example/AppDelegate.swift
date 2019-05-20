//
//  AppDelegate.swift
//  demo
//
//  Created by 纪洪波 on 2018/10/14.
//  Copyright © 2018 Ankit Thakur. All rights reserved.
//

import UIKit
import iPing

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let host1 = IPTool.getGatewayIPAddress()
//        let host2 = IPTool.getDeviceIPAddress()
        let host3 = "www.baidu.com"
        iPing(host: host3).ping(count: 5) {(delay, timeout) in
            print("delay: \(delay)ms, timeout: \(Int(timeout * 100))%")
        }
        return true
    }
}

