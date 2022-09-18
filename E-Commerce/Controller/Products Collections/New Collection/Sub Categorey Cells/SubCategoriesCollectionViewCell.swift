//
//  SubCollectionViewCell.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 10/09/2022.
//

import UIKit

class SubCategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var newCollectionView: UIView!
    @IBOutlet weak var newCollectionLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        Helper.customViews(views: [newCollectionView], cornerRadius: 0.05)
    }
    
}
