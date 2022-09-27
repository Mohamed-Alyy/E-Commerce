//
//  CategoryCollectionViewCell.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 13/09/2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var categoryView: UIView!
    
    @IBOutlet weak var categoryLBL: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func layoutSubviews() {
        Helper.customViews(views: [categoryView], cornerRadius: nil)
    }
    
    
    // MARK: - Actions
    
    override var isSelected: Bool {
        didSet{
            self.categoryView.backgroundColor = isSelected ? .red : .white
            self.categoryLBL.textColor = isSelected ? .white : .black
            //self.categoryView.layer.borderWidth = isSelected ? 1 :  0
        }
    }
     
}
