//
//  TabBar.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 23.01.2024.
//

import Foundation
import UIKit


        // MARK: - tabbar
final class TabBarController: UITabBarController {
    static func createTabBar() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        // MARK: - onebuttonPage
        let onebuttonPage = UINavigationController(rootViewController: OnePageButtonBuilder().build())
        onebuttonPage.tabBarItem = UITabBarItem(title: "Случайная", image: UIImage(systemName: "circle"), tag: 0)
        
        //MARK: - CoreDataListPage
        
        let coreDataListPage = UINavigationController(rootViewController: CoreDataListBuilder().build())
        coreDataListPage.tabBarItem = UITabBarItem(title: "Список", image: UIImage(systemName: "circle"), tag: 1)
        // MARK: - set views
        tabBarController.setViewControllers([onebuttonPage,coreDataListPage], animated: true)
        
        return tabBarController
    }
}
