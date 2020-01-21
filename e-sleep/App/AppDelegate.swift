//
//  AppDelegate.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/10/30.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.rootViewController = selectRootViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func selectRootViewController() -> UIViewController {
        let tabBarController: UIViewController = TabBarController()
//        let registerNameViewController = R.storyboard.registerName.instantiateInitialViewController()
//        let editAcountViewController = EditAcountViewController.make()
        return tabBarController
    }
}
