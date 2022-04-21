//
//  PremiumCell.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 20/04/2022.
//

import UIKit
import ChameleonFramework
import Tactile

class PremiumCell: UITableViewCell {

    @IBOutlet weak var premiumLabel: UILabel!
    @IBOutlet weak var premiumBtn: UIButton!
    @IBOutlet weak var premiumcellView: UIView!
    var onTapPremiumBtn : (()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        binding()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
       setupLayout()
        let margins = UIEdgeInsets(top: 0, left: 0 , bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupLayout(){
        premiumcellView.layer.cornerRadius = 25
        premiumcellView.backgroundColor = UIColor(gradientStyle: .leftToRight, withFrame: self.premiumcellView.bounds, andColors: [UIColor.init(hexString: "00AD93"),UIColor.init(hexString: "00D142")])
    }
    func binding(){
        premiumBtn.tap  { _ in
            self.onTapPremiumBtn?()
        }
    }
    
}
