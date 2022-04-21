//
//  HistoryDataSoure.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 13/04/2022.
//

import Foundation
import UIKit
import Realm
import SDWebImage
import DZNEmptyDataSet
import SwiftyAttributes

protocol HistoryDataSourceDelegate: AnyObject {
    // Delegate callbacks methods
    func loadHistoryDetail(itemModel: HistoryModel)
}
class HistoryDataSource: NSObject{
    var numberOfSection : Int = 1
    var array  : [HistoryModel] = []
    var cellHeight: CGFloat = 150
    var historyDelegate: HistoryDataSourceDelegate?
    
    func registerCell(forTableView tableView: UITableView) {
        tableView.register(cellType: HistoryCell.self, bundle: nil)
    }
    func loadCell(forTableView tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let item = array[indexPath.row]
        let cell = tableView.dequeueReusableCell(with: HistoryCell.self, for: indexPath)
        cell.selectionStyle = .none
        if let firstImageURL = item.images.first {
            let imageURL = URL(string: firstImageURL)
            cell.historyImage.sd_setImage(with: imageURL, completed: nil)
        }
        cell.nameLabel.text = item.name
        cell.descriptionLabel.text = item.full_desc
        cell.nameLabel.restartLabel()
        return cell
    }
    
}


extension HistoryDataSource: UITableViewDataSource {
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
extension HistoryDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.historyDelegate?.loadHistoryDetail(itemModel: array[indexPath.row])
    }

}

extension HistoryDataSource: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage.init(named: "empty")!
    }
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return "No items".withFont(UIFont.systemFont(ofSize: 30)).withTextColor(UIColor.black)
    }
}
