//
//  MainTabbar.swift
//  baseapp
//
//  Created by Alex on 05/01/2022.
//

import Foundation
import UIKit

class MainTabbar: NSObject {
    var tabbarController = UITabBarController()
    
    override init() {
        super.init()
        setTabbarController()
        tabbarController.tabBar.tintColor = UIColor.init(hexString: "00B485")
        tabbarController.tabBar.backgroundColor = .white
    
    }
    
    func setTabbarController() {
        // Hàm này biến đổi mảng được trả về từ hàm getControllers thành mảng UINavigationController với Controller tương ứng
        tabbarController.viewControllers = getControllers().map { UINavigationController(rootViewController: $0) }
    }
    
    func getControllers() -> [UIViewController] {
        // Module Home
        let homeVM = HomeViewModel()
        let homeNav = HomeNavigator()
        let homeVC = HomeController(viewModel: homeVM, navigator: homeNav)
        homeVC.tabBarItem.image = R.image.tabbar_home()
        homeVC.tabBarItem.title = R.string.localizable.home().capitalized
        
        // Module Collection
        let collectionVM = CollectionViewModel()
        let collectionNav = CollectionNavigator()
        let collectionVC = CollectionController(viewModel: collectionVM, navigator: collectionNav)
        collectionVC.tabBarItem.image = UIImage(named: "tabbar_collection")
        collectionVC.tabBarItem.title = R.string.localizable.collection().capitalized
        
        // Module Collection
        let historyVM = HistoryViewModel()
        let historyNav = HistoryNavigator()
        let historyVC = HistoryController(viewModel: historyVM, navigator: historyNav)
        historyVC.tabBarItem.image = R.image.tabbar_history()
        historyVC.tabBarItem.title = R.string.localizable.history().capitalized
        
        // Module Collection
        let userVM = UserViewModel()
        let userNav = UserNavigator()
        let userVC = UserController(viewModel: userVM, navigator: userNav)
        userVC.tabBarItem.image = R.image.tabbar_user()
        userVC.tabBarItem.title = R.string.localizable.user().capitalized
        
        
        
        return [homeVC,collectionVC,historyVC,userVC]
    }
}
