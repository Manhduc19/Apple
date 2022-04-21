//
//  MoreResultsTableViewCell.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 20/04/2022.
//

import UIKit
import MarqueeLabel
class MoreResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var accuracyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: MarqueeLabel!
    @IBOutlet weak var moreResultsImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    func setupLayout(){
        moreResultsImage.layer.cornerRadius = 10
        moreResultsImage.clipsToBounds = true
        
        nameLabel.type = .continuous
        nameLabel.scrollDuration = 5.0
        nameLabel.animationCurve = .easeInOut
        nameLabel.fadeLength = 10.0
        nameLabel.leadingBuffer = 5
        nameLabel.trailingBuffer = 5
    }
    
}
