//
//  MoreResultDataSource.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 20/04/2022.
//

import Foundation
import SDWebImage
import UIKit
import Bond
protocol MoreResultDataSourceDelegate: AnyObject {
    
    func loadResultVC(itemModelArray: [ItemModel], atIndex: Int)
}

class MoreResultDataSource: NSObject{
    var itemIdentifyType: HomeItemType = .plant
    var numberOfSection: Int = 1
    var array: [ItemModel] = []
    var userImage = UIImage()
    var cellHeight: CGFloat = 150
    var moreResultDelegate : MoreResultDataSourceDelegate?
    func registerCell(forTableView tableView: UITableView) {
        tableView.register(cellType: MoreResultsTableViewCell.self, bundle: nil)
    }
    func loadCell(forTableView tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: MoreResultsTableViewCell.self, for: indexPath)
        let item = array[indexPath.row]
        cell.selectionStyle = .none
        if let url = item.images.first {
            cell.moreResultsImage.sd_setImage(with: URL(string: url), completed: nil)
        }
        else {}
        cell.nameLabel.text = item.name
        cell.nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        cell.descriptionLabel.text = item.full_desc
        switch itemIdentifyType {
        case .plant:
            var acc = item.score * 100
            var text = String(format: "%.2f", acc)
            cell.accuracyLabel.text = "Accuracy: \(text) %"
        case .bug:
            var acc = item.confidence
            var text = String(format: "%.2f", acc)
            cell.accuracyLabel.text = "Accuracy: \(text) %"
        }
        cell.nameLabel.restartLabel()
        return cell
    }
}
extension MoreResultDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return loadCell(forTableView: tableView, indexPath: indexPath)
    }
}
extension MoreResultDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moreResultDelegate?.loadResultVC(itemModelArray: array, atIndex: indexPath.row)
    }

}
