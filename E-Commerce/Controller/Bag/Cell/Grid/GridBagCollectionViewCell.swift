//
//  GridBagCollectionViewCell.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 30/09/2022.
//

import UIKit

class GridBagCollectionViewCell: UICollectionViewCell {
    // MARK: - OUtlets
    
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var titleLBL: UILabel!
    
    @IBOutlet weak var descriptionLBL: UILabel!
    
    @IBOutlet weak var priceLBL: UILabel!
    
    @IBOutlet weak var totalCountLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        Helper.customViews(views: [backGroundView], cornerRadius: 0.03)
    }
    
    // MARK: - Actions
    
    @IBAction func xButtonPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func plusBtnPressed(_ sender: UIButton) {
        
    }
    
    
    
    @IBAction func minusBtnPressed(_ sender: UIButton) {
        
    }
}
