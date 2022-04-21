//
//  RRockModel.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 15/04/2022.
//

import Foundation
import Realm
import RealmSwift
import SwiftyAttributes
// history
class PlantBugModel: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var image: String = ""
    @objc dynamic var date = Date()
    @objc dynamic var myDescription: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var confidence: Double = 0
    @objc dynamic var wiki: String = ""
    @objc dynamic var commonname: String = ""
    
    let gallery: List<String> = List<String>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func getConfidence() -> String {
        return "\(confidence)"
    }
    
    func getConfidentAttibute() -> NSAttributedString {
        let accuracyAttibute = "Accuracy: ".withFont(.systemFont(ofSize: 17))
        let percentAttibute = "\(String(format: "%.2f", confidence))%"
            .withFont(.boldSystemFont(ofSize: 17))
            .withTextColor(UIColor.red)
        
        return accuracyAttibute + percentAttibute
    }
    
    func getCommonNameAttibute() -> NSAttributedString {
        let nameAttibute = "Common Name: ".withFont(.systemFont(ofSize: 17))
        let commonNameAttibute = commonname
            .withFont(.boldSystemFont(ofSize: 17))
            .withTextColor(UIColor.red)
        
        return nameAttibute + commonNameAttibute
    }
}
