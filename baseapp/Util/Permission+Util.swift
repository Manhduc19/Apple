//
//  Permission+Util.swift
//  sticker
//
//  Created by Alex on 23/11/2021.
//

import Foundation
import Permission

typealias PUtilBlock<T> = (T) -> Void

class PermissionUtil: NSObject {
    class func checkPhoto(completion: @escaping PUtilBlock<Bool>) {
        let permission: Permission = .photos
        permission.request { status in
            switch status {
            case .authorized: completion(true)
                print("authorized")
            case .denied: completion(false)
                print("denied")
            case .disabled: completion(false)
                print("disabled")
            case .notDetermined: completion(false)
                print("not determined")
            }
        }
    }
    
    class func checkCamera( completion: @escaping PUtilBlock<Bool>) {
        let permission: Permission = .camera
        permission.request { status in
            switch status {
            case .authorized: completion(true)
                print("authorized")
            case .denied: completion(false)
                print("denied")
            case .disabled: completion(false)
                print("disabled")
            case .notDetermined: completion(false)
                print("not determined")
            }
        }
    }
}
