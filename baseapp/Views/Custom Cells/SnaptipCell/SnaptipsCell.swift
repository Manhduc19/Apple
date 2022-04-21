//
//  SnaptipsCell.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 13/04/2022.
//

import UIKit

class SnaptipsCell: UICollectionViewCell {

    @IBOutlet weak var snaptipImage: UIImageView!
    @IBOutlet weak var snaptipLabel: UILabel!
    @IBOutlet weak var snaptipCellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    func setupLayout(){
        snaptipCellView.clipsToBounds = true
        snaptipCellView.layer.cornerRadius = 10
    }

}
