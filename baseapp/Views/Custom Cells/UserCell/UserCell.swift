//
//  UserCell.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 19/04/2022.
//

import UIKit
import Tactile
class UserCell: UITableViewCell {
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var userLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
     
    }

 
    func setupLayout(){
        lineView.backgroundColor = UIColor.init(hexString: "D8D8D8").withAlphaComponent(0.4)
        
    }
   
    
}
