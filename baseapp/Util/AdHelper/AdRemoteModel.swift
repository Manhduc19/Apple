//
//  AdRemoteModel.swift
//  ironad
//
//  Created by Alex on 20/10/2021.
//

import Foundation

// MARK: - REMOTE MODEL

class RemoteModel: Codable {
    var fullLoop: Looper = Looper.init()
    var enableAd: Int = 0
    var ironAppKey: String = ""
    
    enum CodingKeys: String, CodingKey {
        case fullLoop, enableAd, ironAppKey
    }
}

// MARK: - LOOPER

class Looper: Codable {
    var start: Int = 1
    var loop: Int = 3
    var count: Int = 0
    
    func validateLoop() -> Bool {
        count += 1
        let isValid = (count == 1) || (count % loop == 0)
        logAd("Valid : \(isValid) : counter \(count) start: \(start) loop: \(loop)")
        return isValid
    }
    
    enum CodingKeys: String, CodingKey {
        case start, loop
    }
    
}
