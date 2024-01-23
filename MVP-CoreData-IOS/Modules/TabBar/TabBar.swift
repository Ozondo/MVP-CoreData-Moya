//
//  TabBar.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 23.01.2024.
//

import Foundation
import UIKit


final class TabBarController: UITabBarController {
    static func createTabBar() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let onebuttonPage = UINavigationController(rootViewController: OnePageButtonBuilder().build())
        onebuttonPage.tabBarItem = UITabBarItem(title: "1", image: nil, tag: 0)
        
        
        tabBarController.setViewControllers([onebuttonPage], animated: true)
        
        return tabBarController
    }
}
