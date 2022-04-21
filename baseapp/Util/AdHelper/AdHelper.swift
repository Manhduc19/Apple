//
//  AdHelper.swift
//  ironad
//
//  Created by Alex on 20/10/2021.
//

import Foundation
import UIKit

func logAd(_ msg: Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG
    var filename = (file as NSString).lastPathComponent
    filename = filename.components(separatedBy: ".")[0]
    
    let currentDate = Date()
    let df = DateFormatter()
    df.dateFormat = "HH:mm:ss.SSS"
    
    print("┌──────────────┬───────────────────────────────────────────────────────────────")
    print("│ \(df.string(from: currentDate)) │ \(filename).\(function) (\(line))")
    print("└──────────────┴───────────────────────────────────────────────────────────────")
    print("-> \(msg)\n")
    #endif
}

var isISRewardAvailble: Bool {
    return IronSource.hasRewardedVideo()
}
