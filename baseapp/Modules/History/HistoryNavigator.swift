//
//  HistoryNavigator.swift
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

enum HistoryRouter: RouterType {
    case detailResult(itemModel: HistoryModel)
}

class HistoryNavigator: BaseNavigator<HistoryRouter> {
    override func navigate(to:HistoryRouter) {
        switch to {
        case .detailResult(let itemModel):
            let vm = DetailResultViewModel()
            vm.listItem = itemModel
            vm.loadData()
            let nav = DetailResultNavigator()
            let vc = DetailResultController(viewModel: vm, navigator: nav)
            viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }

    deinit {
        print("Deinit: " + String(describing: type(of: self)))
    }

}
