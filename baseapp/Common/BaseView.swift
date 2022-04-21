//
//  BaseView.swift
//  baseapp
//
//  Created by Alex on 04/01/2022.
//

import Foundation
import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    /// Hàm khởi tạo view chung, mọi view trong dự án phải được kết thừa từ BaseView
    /// from the given components.
    ///
    func commonInit() {
        fromNib()
    }
    
    deinit {
        print("Deinit: " + String(describing: type(of: self)))
    }
}
