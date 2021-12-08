//
//  AppDelegate.swift
//  test_couner1
//
//  Created by Alex Solod on 08.12.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            let mainVC = ViewController()
            window?.rootViewController = mainVC

            return true
        }

}

