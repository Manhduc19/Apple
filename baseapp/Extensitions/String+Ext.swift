//
//  String+Ext.swift
//  sticker
//
//  Created by Alex on 25/11/2021.
//

import Foundation
import UIKit

extension String {

    /// Tính toán chiều rộng của chuỗi string dựa theo FontSize
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }

    /// Tính toán chiều cao của chuỗi string dựa theo FontSize
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }

    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}
