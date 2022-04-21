//
//  BaseViewModel.swift
//  baseapp
//
//  Created by Alex on 04/01/2022.
//

import Foundation
import Bond

class BaseViewModel: NSObject {
    
    var isLoading: Observable<Bool> = Observable<Bool>.init(false)
    var isShowAlert = Observable<(Bool, String)>.init((false,String()))

    override init() {
        super.init()
    }
    
    func showLoading() {
        isLoading.send(true)
    }
    
    func hideLoading() {
        isLoading.send(false)
    }
    
    deinit {
        print("Deinit: " + String(describing: type(of: self)))
    }
    
}
