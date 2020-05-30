//
//  AppDelegate.swift
//  COVID
//
//  Created by Pawan kumar on 02/05/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
     var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Check Internet Connection
        NetworkManager.shared.startMonitoring()
        
        return true
    }
}

