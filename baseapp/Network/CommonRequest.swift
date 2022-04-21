//
//  CommonRequest.swift
//  baseapp
//
//  Created by Alex on 05/01/2022.
//

import Foundation
import ObjectMapper
import SwiftyJSON

extension RestAPI {
    func requestAnyObject<T: Mappable>(target: Target,
                                                    objectType: T.Type,
                                                    completionHandler: @escaping (T) -> Void,
                                                    failureHandler :@escaping () -> Void
         ) {
             provider.request(target) { (result) in
                 do {
                     let response = try result.get()
                     if let message = String(data: response.data, encoding: .utf8) {
                         let decryptData = CryptoUtil.decrypt(key: K_DECRYPT_PLANT,
                                                            message: message)
                         guard let data = decryptData else {
                             failureHandler()
                             return }
                         let json = try JSON.init(data: data)
                         print("xxx \(json)")
                         guard let targetObject = T.init(JSON: json.dictionaryObject!) else { return }
                         completionHandler(targetObject)
                     } else {
                         failureHandler()
                     }
                 } catch {
                     failureHandler()
                 }
             }
         }
    
    func requestAnyObject2<T: Mappable>(target: Target,
                                                    objectType: T.Type,
                                                    completionHandler: @escaping (T) -> Void,
                                                    failureHandler :@escaping () -> Void
         ) {
             provider.request(target) { (result) in
                 do {
                     let response = try result.get()
                     if let message = String(data: response.data, encoding: .utf8) {
                         let decryptData = CryptoUtil.decrypt(key: K_DECRYPT_INSECT,
                                                            message: message)
                         guard let data = decryptData else {
                             failureHandler()
                             return }
                         let json = try JSON.init(data: data)
                         print("xxx \(json)")
                         guard let targetObject = T.init(JSON: json.dictionaryObject!) else { return }
                         completionHandler(targetObject)
                     } else {
                         failureHandler()
                     }
                 } catch {
                     failureHandler()
                 }
             }
         }
    
     func rq<T: Mappable>(target: Target,
                                 objectType: T.Type,
                                 cryptoCode: String,
                                 completionHandler: @escaping (T) -> Void,
                                 failureHandler: @escaping () -> Void)
    {
        provider.request(target) { result in
            do {
                let response = try result.get()
                let json = try response.mapJSON()
                log.debug("JSON:==> \(json)", context: nil)
                if let message = json as? String {
                    let decryptData = CryptoUtil.decrypt(key: cryptoCode,
                                                         message: message)
                    guard let data = decryptData else {
                        failureHandler()
                        return
                    }
                    let json = try JSON(data: data)
                    print("xxx \(json)")
                    guard let targetObject = T(JSON: json.dictionaryObject!) else { return }
                    completionHandler(targetObject)
                }
                else {
                    failureHandler()
                }
                
            } catch( let e) {
                log.debug("Errr: \(e)", context: nil)
                failureHandler()
            }
        }
    }
    

}
