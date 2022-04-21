//
//  ResultDataSource.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 15/04/2022.
//

import Foundation
import UIKit
import WebKit
import SnapKit

protocol ResultsDataSourceDelegate: AnyObject {

    func loadWikiCell()
    func addCollection()
    func loadMoreResultsVC()
//    func showWaring()
    func addLoading()
}
class ResultsDataSource: NSObject{
    var array: [Any] = []
    //list anh
    var listImageArray : [String] = []
    
    var cellHeight: CGFloat = 90
    var cellDescription: CGFloat = 180
    var cellWikiHeight : CGFloat = 90
    
    var arrayModel = ItemModel()
    var resultsModel = ResultsModel()
    var itemInformation: String = ""
    var itemDescription: String = ""
  //  var reslutsDataDelegate: ResultsDataSourceDelegate?
    var itemIdentifyType: HomeItemType?
    var reslutsDataDelegate : ResultsDataSourceDelegate?
    
    func registerCell(forTableView tableView: UITableView) {
        tableView.register(cellType: ResultImageCell.self, bundle: nil)
        tableView.register(cellType: NameCell.self, bundle: nil)
        tableView.register(cellType: DescriptionCell.self, bundle: nil)
        tableView.register(cellType: WikiCell.self, bundle: nil)
        tableView.register(cellType: MoreResultCell.self, bundle: nil)
    }
    
    func loadCell(forTableView tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(with: ResultImageCell.self, for: indexPath)
            cell.data = listImageArray
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(with: NameCell.self, for: indexPath)
            cell.nameLabel.text = resultsModel.itemInformation
           
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(with: DescriptionCell.self, for: indexPath)
            cell.descriptionLabel.text = resultsModel.itemDescription
            return cell
        }
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(with: WikiCell.self, for: indexPath)
            cell.selectionStyle = .none
            if self.resultsModel.url != "" {
                cell.isHidden = false
            }
            else if self.resultsModel.url == nil {
                cell.isHidden = true
            }
            else {
                cell.isHidden = true
            }
            cell.delegate = self
            cell.delegate2 = self
            cell.onTapWikiBtn = {
                if let url = self.resultsModel.url {
                    cell.loadWebView(urlString: url)
                    cell.buttonView.isHidden = true
                    cell.wikiButton.isHidden = true
                    self.reslutsDataDelegate?.addLoading()
                }
                else {
                    cell.isHidden = true
                }
                
                
            }
            return cell
           
        }
        else {
            
            let cell = tableView.dequeueReusableCell(with: MoreResultCell.self, for: indexPath)
              cell.selectionStyle = .none
              cell.onTapResultBtn = {
                print("more results")
                self.reslutsDataDelegate?.loadMoreResultsVC()
                
            }
            cell.onTapAddToCollection = {
                print("add to collection")
                self.reslutsDataDelegate?.addCollection()
                cell.addToCollectionLabel.text = "Added To Collection"
            }
                return cell
            }
        }
}
// MARK: UITableViewDataSource

extension ResultsDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return loadCell(forTableView: tableView, indexPath: indexPath)
    }
}

// MARK: UITableViewDelegate

extension ResultsDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return tableView.frame.size.height * 0.3
            
        }
        else if indexPath.row == 1 {
            return cellHeight / 2
        }
        else if indexPath.row == 2 {
            return UITableView.automaticDimension
        }
        else if indexPath.row == 3 {
            return cellWikiHeight
        }
        else {
            return cellHeight 
        }
    }
    
}

extension ResultsDataSource: WKUIDelegate, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.readyState", completionHandler: { (complete, error) in
            if complete != nil {
                webView.evaluateJavaScript("document.documentElement.scrollHeight", completionHandler: { (height, error) in
                    guard let heightT = height as? CGFloat else { return }
                    DispatchQueue.main.async {
                        self.cellWikiHeight = heightT
                        webView.invalidateIntrinsicContentSize()
                        self.reslutsDataDelegate?.loadWikiCell()
                    
                    }
                })
            }
        })
    }
}
