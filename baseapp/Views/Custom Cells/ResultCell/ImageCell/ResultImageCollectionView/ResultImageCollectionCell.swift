//
//  ResultImageCollectionCell.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 17/04/2022.
//

import UIKit

class ResultImageCollectionCell: UICollectionViewCell {
    @IBOutlet weak var image : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLayout()
    }
    func setupLayout(){
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
    }

}
