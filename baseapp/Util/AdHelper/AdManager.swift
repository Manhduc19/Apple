//
//  AdManager.swift
//  ironad
//
//  Created by Alex on 20/10/2021.
//

import Foundation
import JGProgressHUD
import UIKit

typealias AdComplete = (() -> Void)

class AdManager: NSObject {
    // Singleton
    static let shared = AdManager()
    
    // Controller cần hiển thị quảng cáo
    var controller: UIViewController?
    
    // Callback cho quảng cáo full
    var complete: AdComplete?
    
    // Callback cho quảng cáo reward
    var rewardComplete: AdComplete?
    
    // Loading
    private var hud = JGProgressHUD(style: .dark)
    
    // Hàm hiển thị quảng cáo full
    func showFull(from controller: UIViewController, complete: @escaping AdComplete) {
        let remoteModel = AdRemote.sharedInstance.remoteModel
        
        if remoteModel.enableAd != 1 {
            complete()
            return
        }
        
        if remoteModel.ironAppKey.isEmpty {
            complete()
            return
        }
        
        if remoteModel.fullLoop.validateLoop() == false {
            complete()
            return
        }
        
        self.complete = complete
        self.controller = controller
        
        DispatchQueue.main.async {
            self.hud.show(in: self.controller!.view, animated: true)
        }
        
        IronSource.loadInterstitial()
        IronSource.setInterstitialDelegate(self)
    }
    
    func showRewardAd(from controller: UIViewController, complete: @escaping AdComplete) {
        let remoteModel = AdRemote.sharedInstance.remoteModel
        
        if remoteModel.enableAd != 1 {
            complete()
            return
        }
        
        if remoteModel.ironAppKey.isEmpty {
            complete()
            return
        }
        
        if remoteModel.fullLoop.validateLoop() == false {
            complete()
            return
        }
        
        self.rewardComplete = complete
        self.controller = controller

        IronSource.setRewardedVideoDelegate(self)
        
        let isRewardReady = IronSource.hasRewardedVideo()
        print("ISRewardAd is: \(isRewardReady)")
        if isRewardReady {
            IronSource.showRewardedVideo(with: self.controller!)
        } else {
            DispatchQueue.main.async { [self] in
                self.hud.dismiss(afterDelay: 0.5)
                rewardComplete?()
            }
        }
    }
    
    func fetchRewardAd() {
        IronSource.hasRewardedVideo()
    }
}

// MARK: - Delegate quảng cáo full

extension AdManager: ISInterstitialDelegate {
    func interstitialDidLoad() {
        DispatchQueue.main.async {
            self.hud.dismiss(afterDelay: 0.5)
        }
        if IronSource.hasInterstitial() == false {
            complete?()
            return
        }
        
        if let vc = controller {
            IronSource.showInterstitial(with: vc)
        } else {
            complete?()
        }
    }
    
    func interstitialDidFailToLoadWithError(_ error: Error!) {
        DispatchQueue.main.async {
            self.hud.dismiss(afterDelay: 0.5)
        }
        complete?()
    }
    
    func interstitialDidOpen() {}
    
    func interstitialDidClose() {
        complete?()
    }
    
    func interstitialDidShow() {}
    
    func interstitialDidFailToShowWithError(_ error: Error!) {
        complete?()
    }
    
    func didClickInterstitial() {}
}

// MARK: - Delegate quảng cáo reward

extension AdManager: ISRewardedVideoDelegate {
    func rewardedVideoHasChangedAvailability(_ available: Bool) {}
    
    func didReceiveReward(forPlacement placementInfo: ISPlacementInfo!) {}
    
    func rewardedVideoDidFailToShowWithError(_ error: Error!) {
        rewardComplete?()
    }
    
    func rewardedVideoDidOpen() {}
    
    func rewardedVideoDidClose() {
        rewardComplete?()
    }
    
    func rewardedVideoDidStart() {}
    
    func rewardedVideoDidEnd() {
        rewardComplete?()
    }
    
    func didClickRewardedVideo(_ placementInfo: ISPlacementInfo!) {
        rewardComplete?()
    }
}
