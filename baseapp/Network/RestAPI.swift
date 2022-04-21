//
//  RestAPI.swift
//  baseapp
//
//  Created by Alex on 05/01/2022.
//

import Foundation
import ObjectMapper
import SwiftyJSON
import UIKit
class RestAPI: APIProtocol {
    // Singleton
    static let shared = RestAPI()
//    func getPlantIdentify(image: UIImage, complete: @escaping (([ItemModel]?) -> Void)) {
//        requestAnyObject(target: .plantIdentify(image: image), objectType: DNResponse<ItemModel>.self) { results in
//            if results.data == [] {
//                complete(nil)
//            }
//            else {
//                complete(results.data)
//            }
//        } failureHandler: {
//            complete(nil)
//        }
//    }
    func getPlantIdentify(image: UIImage, complete: @escaping (([ItemModel]?) -> Void)) {
        rq(target: .plantIdentify(image: image), objectType: DNResponse<ItemModel>.self, cryptoCode: K_DECRYPT_PLANT) { results in
            if results.data == [] {
                complete(nil)
            }
            else {
                complete(results.data)
            }
        } failureHandler: {
            complete(nil)
        }
    }

    
    func getBugIdentify(image: UIImage, complete: @escaping (([ItemModel]?) -> Void)) {
        requestAnyObject2(target: .bugIdentify(image: image), objectType: DNResponse<ItemModel>.self) { results in
            if results.data == [] {
                complete(nil)
            }
            else {
                complete(results.data)
            }
        } failureHandler: {
            complete(nil)
        }
    }
    
}

