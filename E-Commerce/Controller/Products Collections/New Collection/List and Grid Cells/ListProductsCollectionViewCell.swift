//
//  NewCollectionViewCell.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 10/09/2022.
//

import UIKit

protocol FavoriteDelegateProtocol{
    func didFavoriteTapped(row: Int)
    func didXbuttonTapped(favRow: Int)
}


class ListProductsCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var subCollecBgroundView: UIView!
    
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var descriptionLBL: UILabel!
    @IBOutlet weak var priceLBL: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var rateingImageView: UIImageView!
    
    @IBOutlet weak var favoriteBtn: UIButton!
    @IBOutlet weak var xBtnOUtlet: UIButton!
    
  
    
    
    
    override func layoutSubviews() {
        Helper.customViews(views: [subCollecBgroundView], cornerRadius: nil)
    }
    
    
    var cellRow : Int?
    var delegate: FavoriteDelegateProtocol?
    
    
    
    @IBAction func favoriteBtnPressed(_ sender: UIButton) {
        if let cellRow{
            delegate?.didFavoriteTapped(row: cellRow)
        }
    }
    
    
    
    @IBAction func xBtnPressed(_ sender: UIButton)  {
        if let cellRow{
            delegate?.didXbuttonTapped(favRow: cellRow)
        }
    }
    
    
}


