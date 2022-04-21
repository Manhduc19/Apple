//
//  AppDelegate.swift
//  baseapp
//
//  Created by Alex on 04/01/2022.
//

import UIKit
import Firebase
import SwiftyStoreKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Sử dụng hàm này để có thể hiện thị log của firebase
        FirebaseApp.configure()
        
        // Sử dụng hàm này để lấy các config từ Firebase Remote
        AdRemote.sharedInstance.start { _, _ in }

        // Sử dụng hàm này để cấu hình các gói bán trong app
        Payer.shared.config(subscriptions: [K_PRODUCT_WEEKLY,
                                              K_PRODUCT_YEARLY
                                              ],
                            appleSecretKey: K_APPLE_SECRET)
        
        // Sử dụng hàm này để hoàn thành các giao dịch đang chờ
        Payer.shared.completeTransactions { _, _ in
            
        }
        
//        SwiftyStoreKit.shouldAddStorePaymentHandler = { payment,product in
//           
//        }
        
        // Khởi tạo với UITabbarController
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabbar = Onboarding1Controller()
        let controller = UINavigationController.init(rootViewController: tabbar)
        window.rootViewController = controller
        window.makeKeyAndVisible()
        self.window = window
//        
//        let window = UIWindow(frame: UIScreen.main.bounds)
//        let viewModel = PremiumViewModel()
//        let navigator = PremiumNavigator()
//        let vc = PremiumController(viewModel: viewModel, navigator: navigator)
//        window.rootViewController = vc
//        window.makeKeyAndVisible()
//        self.window = window
        return true
    }


}

