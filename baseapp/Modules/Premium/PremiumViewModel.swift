//
//  PremiumViewModel.swift
//  baseapp
//
//  Created Thanh Nguyên Trần on 14/04/2022.
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
enum SelectSetPurchase {
    case week
    case month
    case year
}
class PremiumViewModel: BaseViewModel{
    var isPurchased = Observable<Bool>.init(false)
    var userSelectOption: SelectSetPurchase = .week
    
    func purchase() {
//#if DEBUG
//        Payer.shared.setPurchased()
//        isPurchased.send(true)
//        print("user purchased \(userSelectOption)")
//#else
        var K_PRODUCT = ""
        switch userSelectOption {
        case .week:
            K_PRODUCT = K_PRODUCT_WEEKLY
        case .month:
            K_PRODUCT = K_PRODUCT_MONTHLY
        case .year:
            K_PRODUCT = K_PRODUCT_YEARLY
        }
        showLoading()
        Payer.shared.purchase(product: K_PRODUCT) {[weak self] success, errorMsg in
            guard let strongSelf = self else { return }
            strongSelf.hideLoading()
            if success {
                strongSelf.isPurchased.send(true)
                print("user purchased \(K_PRODUCT)")
            } else {
                strongSelf.isShowAlert.send((true, errorMsg ?? "Unknown"))
            }
        }
//#endif
    }
    func restore() {
#if DEBUG
        Payer.shared.setPurchased()
        isPurchased.send(true)
#else
        showLoading()
        Payer.shared.restore { [weak self] success, errorMsg in
            guard let strongSelf = self else { return }
            strongSelf.hideLoading()
            if success {
                strongSelf.isPurchased.send(true)
            } else {
                strongSelf.isShowAlert.send((true, errorMsg ?? "Unknown"))
            }
        }
        
#endif
    }
    
    deinit {
        print("Deinit: " + String(describing: type(of: self)))
    }

}



