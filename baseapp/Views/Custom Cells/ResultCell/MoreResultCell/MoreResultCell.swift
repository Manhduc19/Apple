//
//  MoreResultCell.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 13/04/2022.
//

import UIKit
import Tactile
class MoreResultCell: UITableViewCell {
    @IBOutlet weak var addToCollectionView: UIView!
    @IBOutlet weak var moreResultsView: UIView!
    
    @IBOutlet weak var moreResultsLabel: UILabel!
    @IBOutlet weak var addToCollectionLabel: UILabel!
    
    @IBOutlet weak var addToCollectionBtn: UIButton!
    @IBOutlet weak var moreResultBtn: UIButton!
    var onTapAddToCollection : (()-> Void)?
    var onTapResultBtn : (()-> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
       // setupLayout()
        binding()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
       setupLayout()
    }
    
    func setupLayout(){
        addToCollectionView.layer.cornerRadius = 23
        moreResultsView.layer.cornerRadius = 23
        addToCollectionView.backgroundColor = UIColor(gradientStyle: .leftToRight, withFrame: self.addToCollectionView.bounds, andColors: [UIColor.init(hexString: "5CB98B"),UIColor.init(hexString: "98D941")])
        moreResultsView.backgroundColor = UIColor(gradientStyle: .leftToRight, withFrame: self.addToCollectionView.bounds, andColors: [UIColor.init(hexString: "5CB98B"),UIColor.init(hexString: "98D941")])
    }
    func binding(){
        addToCollectionBtn.tap { _ in
            self.onTapAddToCollection?()
        }
        
        moreResultBtn.tap { _ in
            self.onTapResultBtn?()
        }
    }
}
    
    
