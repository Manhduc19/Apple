//
//  PremiumDataSoure.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 20/04/2022.
//

import Foundation
protocol PremiumDataSourceDelegate: AnyObject {
    // Delegate callbacks methods
    func selectPurchase()
}
class PremiumDataSoure : NSObject{
    var heightSpace : CGFloat = 10
    var premiumDelegate : PremiumDataSourceDelegate?
    var data : [String] = ["$3.99/week","$7.99/month","$29.99/year"]
    func registerCell(forTableView tableView: UITableView) {
        tableView.register(cellType: PremiumCell.self, bundle: nil)
    }
    func loadCell(forTableView tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: PremiumCell.self, for: indexPath)
        cell.premiumLabel.text = data[indexPath.row]
        return cell
    }
}
extension PremiumDataSoure: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return loadCell(forTableView: tableView, indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.t
    }
}
// MARK: UITableViewDelegate
extension PremiumDataSoure: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (tableView.frame.size.height - (2 * heightSpace)) / 3
    }
    
}
