//
//  HistoryModel.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 18/04/2022.
//

import Foundation
import UIKit
import SwiftyAttributes
class HistoryModel: NSObject {
    var id: String = ""
    var name: String = ""
    var image: String = ""
    var confidence: Double = 0
    var wiki_link: String = ""
    var images: [String] = []
    var full_desc: String = ""
    var date = Date()
    var commonName: String = ""
        
    override init () {
    }
    
    func getConfidentAttibute() -> NSAttributedString {
        let accuracyAttibute = "Accuracy: ".withFont(.systemFont(ofSize: 17))
        let percentAttibute = "\(String(format: "%.2f", confidence))%"
            .withFont(.boldSystemFont(ofSize: 17))
        return accuracyAttibute + percentAttibute
    }
    
    func getCommonNameAttibute() -> NSAttributedString {
        let nameAttibute = "Common Name: ".withFont(.systemFont(ofSize: 17))
        let commonNameAttibute = commonName
            .withFont(.boldSystemFont(ofSize: 17))
        return nameAttibute + commonNameAttibute
    }
}
