//
//  Navigator.swift
//  baseapp
//
//  Created by Alex on 05/01/2022.
//

import Foundation

protocol RouterType {}
protocol AppNavigator {
    var viewController: UIViewController? { get set }
}

class BaseNavigator<T: RouterType>: NSObject, AppNavigator {
    
    weak var viewController: UIViewController?
    
    func navigate(to: T) {}
    func setRootViewController(_ vc: UIViewController, animate: Bool = true) {
        guard animate, let window = appDelegate.window else {
            appDelegate.window!.rootViewController = vc
            appDelegate.window!.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
        
    }
}
