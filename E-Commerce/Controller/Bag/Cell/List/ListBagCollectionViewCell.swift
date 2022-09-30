//
//  MyBagCollectionViewCell.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 30/09/2022.
//

import UIKit

class ListBagCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var bagCollecBgroundView: UIView!
    
    @IBOutlet weak var bagImage: UIImageView!
    
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var descriptionLBL: UILabel!
    @IBOutlet weak var priceLBL: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        Helper.customViews(views: [bagCollecBgroundView], cornerRadius: nil)
    }
    
    // MARK: - Actions
    
    
    @IBAction func plusBtnPressed(_ sender: UIButton) {
        
    }
    
    
    
    @IBAction func minusBtnPressed(_ sender: UIButton) {
        
    }
    
}
