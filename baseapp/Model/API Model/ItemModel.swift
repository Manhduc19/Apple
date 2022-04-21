//
//  ItemModel.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 15/04/2022.
//

import Foundation
import ObjectMapper
import SwiftyJSON
import SwiftyAttributes

class ItemModel: NSObject, Mappable {
    var uuid: String = UUID().uuidString
    var name: String = ""
    var confidence: Double = 0
    var score: Double = 0
    var wiki_link: String = ""
    var images: [String] = []
    var full_description: String = ""
    var full_desc: String = ""
    var commonName: [String] = []
    var family: String = ""
    var image:  String = ""
    var date = Date()
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        full_desc <- map["full_desc"]
        confidence <- map["confidence"]
        wiki_link <- map["wiki_link"]
        images <- map["images"]
        full_description <- map["full_description"]
        commonName <- map["common_names"]
        full_desc <- map["full_desc"]
        family <- map["family"]
        score <- map["score"]
    }
    
    func getDesc() -> String {
        if full_desc.count != 0 {
            return full_desc
        } else if full_description.count != 0 {
            return full_description
        } else {
            return ""
        }
    }
    
    func getName() -> String {
        return name
    }
    
//    func getConfidentAttibute() -> NSAttributedString {
//        let accuracyAttibute = "Accuracy: ".withFont(.systemFont(ofSize: 17))
//        let percentAttibute = "\(String(format: "%.2f", confidence == 0 ? score * 100 : confidence ))%"
//            .withFont(.boldSystemFont(ofSize: 18))
//            .withTextColor(UIColor.init(hex: "129875"))
//
//        return accuracyAttibute + percentAttibute
//    }
}
