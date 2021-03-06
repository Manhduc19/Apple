//
//  HomeNavigator.swift
//  baseapp
//
//  Created Thanh Nguyên Trần on 13/04/2022.
//  Copyright © 2022 Avengers Mobile Team. All rights reserved.
//
//  Template generated by Avengers Mobile Team
//

import Foundation

//                        _oo0oo_
//                       o8888888o
//                       88" . "88
//                       (| -_- |)
//                       0\  =  /0
//                     ___/`---'\___
//                   .' \|     |// '.
//                  / \|||  :  |||// \
//                 / _||||| -:- |||||- \
//                |   | \\  -  /// |   |
//                | \_|  ''\---/''  |_/ |
//                \  .-\__  '-'  ___/-. /
//              ___'. .'  /--.--\  `. .'___
//           ."" '<  `.___\_<|>_/___.' >' "".
//          | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//          \  \ `_.   \_ __\ /__ _/   .-` /  /
//      =====`-.____`.___ \_____/___.-`___.-'=====
//                        `=---='
// Đức phật nơi đây phù hộ code con chạy không Bug. Nam mô a di đà Phật

enum HomeRouter: RouterType {

    case camera(type : HomeItemType)
    case premium
}

class HomeNavigator: BaseNavigator<HomeRouter> {
    override func navigate(to:HomeRouter) {
        switch to {

        case .camera(let typeIdentify) :
            let vm = CameraViewModel()
            vm.itemIdentify = typeIdentify
            let nav = CameraNavigator()
            let vc = CameraController.init(viewModel: vm, navigator: nav)
            vc.hidesBottomBarWhenPushed = true
            viewController?.navigationController?.pushViewController(vc, animated: true)
        case .premium :
            let viewModel = PremiumViewModel()
            let navigator = PremiumNavigator.init()
            let controller = PremiumController(viewModel: viewModel, navigator: navigator)
            controller.modalPresentationStyle = .fullScreen
            viewController?.navigationController?.present(controller, animated: true)
                                                                     
    }
 }
    deinit {
        print("Deinit: " + String(describing: type(of: self)))
    }

}
