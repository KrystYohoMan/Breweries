//
//  AppDelegate.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 29.06.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = UINavigationController(rootViewController: BreweriesViewController())
        window?.makeKeyAndVisible()
        return true
    }
}

