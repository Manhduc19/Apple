//
//  ResultImageCell.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 15/04/2022.
//

import UIKit
import SDWebImage
class ResultImageCell: UITableViewCell {

    var data : [String] = []
    @IBOutlet weak var imageCollectionView: UICollectionView!
    var onTapDetail : (()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.register(cellType: ResultImageCollectionCell.self, bundle: nil)
    }

   
    
}
extension ResultImageCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: ResultImageCollectionCell.self, for: indexPath)
        let item = data[indexPath.row]
        let imageURL = URL(string: item)
        cell.image?.sd_setImage(with: imageURL, completed: nil)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.onTapDetail?()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height * 0.7, height: collectionView.frame.height * 0.7)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}

