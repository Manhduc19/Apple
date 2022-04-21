//
//  AdRemote.swift
//  ironad
//
//  Created by Alex on 20/10/2021.
//

import Foundation
import UIKit
import Firebase
import FirebaseAnalytics

class AdRemote: NSObject {
    private var remote = RemoteConfig.remoteConfig()
    private var settings = RemoteConfigSettings()
    private var expirationDuration: TimeInterval = 0
    
    var remoteModel: RemoteModel = RemoteModel()
    
    public static let sharedInstance: AdRemote = {
        let instance = AdRemote()
        instance.settings.minimumFetchInterval = 0
        instance.remote.configSettings = instance.settings
        return instance
    }()
    
    func start(complete: @escaping ((RemoteModel?, AdCustomError?) -> Void)) {
        logAd("Fetch Remote configs")
        remote.fetch(withExpirationDuration: expirationDuration) { status, _ in
            if status == .success {
                self.remote.activate(completion: nil)
                let jsonData = self.remote["node"].dataValue
                let decoder = JSONDecoder()
                let _remoteModel = try? decoder.decode(RemoteModel.self, from: jsonData)
                if let model = _remoteModel {
                    if let JSON = self.remote["node"].jsonValue {
                        logAd(JSON)
                        if model.enableAd == 1 {
                            logAd("Enable IronSource Ad")
                            IronSource.initWithAppKey(model.ironAppKey)
                            ISIntegrationHelper.validateIntegration()
                            IronSource.hasRewardedVideo()
                        } else {
                            logAd("Disable IronSource Ad")
                        }
                        self.remoteModel = model
                        AdManager.shared.fetchRewardAd()
                        complete(model, nil)
                    } else {
                        logAd("Error: \(AdCustomError.unknownJSON)")
                        complete(nil, AdCustomError.unknownJSON)
                    }
                } else {
                    logAd("Error: \(AdCustomError.mapperJSON)")
                    complete(nil, AdCustomError.mapperJSON)
                }
            } else {
                logAd("Error: Fetch remote failure")
            }
        }
    }
}


