//
//  SortByCollectionViewCell.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 18/09/2022.
//

import UIKit

class SortingByCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sortingLBL: UILabel!
    @IBOutlet weak var sortingView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        Helper.customViews(views: [sortingView], cornerRadius: nil)
        //self.layer.cornerRadius = 20
    }
    
    override var isSelected: Bool{
        didSet{
            sortingView.backgroundColor = isSelected ? .systemRed : .white
            sortingLBL.textColor = isSelected ? .white : .black
        }
    }
}
