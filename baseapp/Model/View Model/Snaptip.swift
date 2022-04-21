//
//  SettingModel.swift
//  baseapp
//
//  Created by Alex on 05/01/2022.
//

import Foundation
class SnapTipsModel: NSObject {

var label : String?
var image : UIImage?
init(label : String , image : UIImage?){
    self.label = label
    self.image = image
}
}
let DataSnapTips : [SnapTipsModel] = [
    SnapTipsModel(label: "Too Dark", image: R.image.snaptip_dark()),
 SnapTipsModel(label: "Too Far", image: R.image.snaptip_far()),
 SnapTipsModel(label: "Too Blurry", image: R.image.snaptip_blurry()),
 SnapTipsModel(label: "Too Brightness", image: R.image.snaptip_brightness())

]
