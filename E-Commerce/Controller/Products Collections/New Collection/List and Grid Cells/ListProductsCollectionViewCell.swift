//
//  NewCollectionViewCell.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 10/09/2022.
//

import UIKit

class ListProductsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var subCollecBgroundView: UIView!
    @IBOutlet weak var productsCollImageView: UIImageView!
    @IBOutlet weak var rateingImageView: UIImageView!


    @IBOutlet weak var collTypeNameLBL: UILabel!
    @IBOutlet weak var collSubTypeNameLBL: UILabel!
    @IBOutlet weak var collPriceLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func layoutSubviews() {
        Helper.customViews(views: [subCollecBgroundView , productsCollImageView], cornerRadius: nil)
        productsCollImageView.layer.borderWidth = 0.3
    }
    
}
