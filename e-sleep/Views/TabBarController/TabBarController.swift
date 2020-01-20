//
//  TabBarController.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/20.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rankingStoryboard: UIStoryboard = UIStoryboard(name: "Ranking", bundle: nil)
        let rankingViewController: UIViewController = rankingStoryboard.instantiateViewController(withIdentifier: "Ranking")
        rankingViewController.tabBarItem = UITabBarItem(title: "Ranking", image: R.image.crown30(), tag: 1)
    
        let alarmsStoryboard: UIStoryboard = UIStoryboard(name: "Alarm", bundle: nil)
        let alarmsViewController: UIViewController = alarmsStoryboard.instantiateViewController(withIdentifier: "Alarm")
        alarmsViewController.tabBarItem = UITabBarItem(title: "Alarm", image: R.image.alarm30(), tag: 3)
        
        let settingsStoryboard: UIStoryboard = UIStoryboard(name: "Settings", bundle: nil)
        let settingsViewController: UIViewController = settingsStoryboard.instantiateViewController(withIdentifier: "Settings")
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: R.image.settings30(), tag: 4)
        
        let viewControllers: [UIViewController] = [
            rankingViewController,
            alarmsViewController,
            settingsViewController
        ]
        
        setViewControllers(viewControllers, animated: true)
    }
}
