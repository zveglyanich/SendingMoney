//
//  AppDelegate.swift
//  SendingMoney
//
//  Created by Павел Звеглянич on 04.10.2020.
//  Copyright © 2020 Pavel Zveglyanich. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var coreDataStack = CoreDataStack()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        // Override point for customization after application launch.
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
