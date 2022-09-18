//
//  SlectSizeCollectionViewCell.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 15/09/2022.
//

import UIKit

class SelectSizeCollectionViewCell: UICollectionViewCell {

 
    @IBOutlet weak var sizeLBL: UILabel!
    
    @IBOutlet weak var sizeBtnOUtlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
    }
    
    override var isSelected: Bool{
        didSet{
            self.layer.backgroundColor = isSelected ? UIColor.systemRed.cgColor : UIColor.white.cgColor
            self.layer.borderColor = isSelected ? UIColor.yellow.cgColor : UIColor.black.cgColor
            //.layer.borderWidth = isSelected ? 100 : 1
            sizeLBL.textColor = isSelected ? UIColor.white : UIColor.black
        }
    }
  
    
}
