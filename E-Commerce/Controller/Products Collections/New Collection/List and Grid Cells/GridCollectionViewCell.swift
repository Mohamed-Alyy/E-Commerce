//
//  GridCollectionViewCell.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 11/09/2022.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {

    // MARK: - OUTLETS
    
    @IBOutlet weak var gridCollectionImageView: UIImageView!
 
    @IBOutlet weak var gridCollectionBgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        Helper.customViews(views: [gridCollectionBgView, gridCollectionImageView], cornerRadius: 0.03)
        gridCollectionImageView.layer.borderWidth = 0.3
    }
}
