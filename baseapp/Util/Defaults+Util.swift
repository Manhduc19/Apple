//
//  Defaults+Util.swift
//  sticker
//
//  Created by Alex on 23/11/2021.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    var applaunch: DefaultsKey<Int> { .init("applaunch", defaultValue: 0) }
    var firstRate: DefaultsKey<Bool> { .init("firstRate", defaultValue: false) }
    var trialCount: DefaultsKey<Int> {.init("trialCount", defaultValue: 0)}
    var isCompleteOnBoarding: DefaultsKey<Bool> { .init("isCompleteOnBoarding", defaultValue: false)}
    var imageCounter: DefaultsKey<Int> { .init("imageCounter", defaultValue: 0)}
}

class DefaultsUtil: NSObject {

    static func resetAppLaunch() {
        Defaults[\.applaunch] = 0
    }

    static func incrementAppLaunch() {
        Defaults[\.applaunch] += 1
    }

    // Rating
    static func isShowRate() -> Bool {
        let count = Defaults[\.applaunch]
        if count == 3 || count == 6 || count == 9 {
            return true
        } else {
            return false
        }
    }

    static func isShoweRateFromResult() -> Bool {
        if Defaults[\.firstRate] == false {
            Defaults[\.firstRate] = true
            return true
        } else {
            return false
        }
    }
    
    // Valid trial
    static func isValidFreeTrial() -> Bool {
        if Defaults[\.trialCount] < K_LIMIT_TRIAL {
            return true
        }
        return false
    }
    
    static func inCrementFreeTrial() {
        Defaults[\.trialCount] += 1
    }
    
    
    // OnBoarding
    static func isCompleteOnboarding() -> Bool {
        return Defaults[\.isCompleteOnBoarding]
    }
    
    static func completeOnboarding() {
        Defaults[\.isCompleteOnBoarding] = true
    }
    
    static func unCompleteOnboarding() {
        Defaults[\.isCompleteOnBoarding] = false
    }
    
    static func getImageCounter() -> Int {
        Defaults[\.imageCounter] += 1
        return Defaults[\.imageCounter]
    }
    
}
