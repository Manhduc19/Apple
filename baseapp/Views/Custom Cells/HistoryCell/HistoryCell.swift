//
//  HistoryCell.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 13/04/2022.
//

import UIKit
import MarqueeLabel
class HistoryCell: UITableViewCell {

    @IBOutlet weak var historyImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: MarqueeLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

   
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    func setupLayout(){
        historyImage.layer.cornerRadius = 10
        historyImage.clipsToBounds = true
        //
        nameLabel.type = .continuous
        nameLabel.scrollDuration = 5.0
        nameLabel.animationCurve = .easeInOut
        nameLabel.fadeLength = 10.0
        nameLabel.leadingBuffer = 5
        nameLabel.trailingBuffer = 5
    }
    
}
