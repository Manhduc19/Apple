//
//  CollectionDataSoure.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 18/04/2022.
//

import Foundation
import UIKit
import Realm
import DZNEmptyDataSet
protocol CollectDataSourceDelegate: AnyObject {
    func confirmDeletePlantItem(itemModel : HistoryModel?)
    func confirmDeleteBugItem(itemModel : HistoryModel?)
    func loadCollectionDetail(itemModel: HistoryModel )
}
class CollectionDataSource: NSObject {
    var numberOfSection: Int = 1
    var array: [HistoryModel] = []
    var cellHeight: CGFloat = 150
    var collectionDelegate: CollectDataSourceDelegate?
    var typeCollection : HomeItemType = .plant
   
    func registerCell(forTableView tableView: UITableView) {
        tableView.register(cellType: CollectionCell.self, bundle: nil)
    }
    func loadCell(forTableView tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let item = array[indexPath.row]
        let cell = tableView.dequeueReusableCell(with: CollectionCell.self, for: indexPath)
        
        cell.nameLabel.text = item.name
        cell.descriptionLabel.text = item.full_desc
        
        cell.collectinImage.image = UIImage(contentsOfFile: getImageFormDocumentDirectory(lastComponent: item.image).path)
        
        cell.onTapDeleteButton = {
            if self.typeCollection == .plant{
                self.collectionDelegate?.confirmDeletePlantItem(itemModel: item)
            }
            else {
                self.collectionDelegate?.confirmDeleteBugItem(itemModel: item)
            }
        }
        cell.nameLabel.restartLabel()

        cell.selectionStyle = .none

        return cell
    }
}
extension CollectionDataSource: UITableViewDataSource {
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
extension CollectionDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.collectionDelegate?.loadCollectionDetail(itemModel: array[indexPath.row])
    }

}


// empty
extension CollectionDataSource: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage.init(named: "empty")!
    }
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return "No items".withFont(UIFont.systemFont(ofSize: 30)).withTextColor(UIColor.black)
    }
}
