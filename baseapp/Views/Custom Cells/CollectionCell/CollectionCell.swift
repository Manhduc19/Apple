//
//  CollectionCell.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 13/04/2022.
//

import UIKit
import MarqueeLabel
class CollectionCell: UITableViewCell {

    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var collectinImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: MarqueeLabel!
    var onTapDeleteButton: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
        binding()
    }
    
    func setupLayout(){
        collectinImage.layer.cornerRadius = 10
        collectinImage.clipsToBounds = true
        // marqueelabel
        nameLabel.type = .continuous
        nameLabel.scrollDuration = 5.0
        nameLabel.animationCurve = .easeInOut
        nameLabel.fadeLength = 10.0
        nameLabel.leadingBuffer = 5
        nameLabel.trailingBuffer = 5

    }
    func binding(){
        deleteBtn.tap { _ in
            self.onTapDeleteButton?()
        }
    }
    
}
