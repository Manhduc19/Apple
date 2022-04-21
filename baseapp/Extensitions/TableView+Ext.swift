//
//  TableView+Ext.swift
//  sticker
//
//  Created by Alex on 23/11/2021.
//

import Foundation
import UIKit

public extension UITableView {
    
    /// Đăng kí cell cho tableView
    internal func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }

    /// Đăng kí mảng cell cho tableView
    func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }

    /// Custom Reuse cel
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}
