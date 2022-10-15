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
    //func setFavButtonImage(row: Int)
    
}


class ListProductsCollectionViewCell: UICollectionViewCell{
    
    // MARK: - OUtlets
    
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
    
    // MARK: - Properties
    
    var cellRow : Int?
    var delegate: FavoriteDelegateProtocol?
    
    
    
    // MARK: - Actions
    
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
    
    // MARK: - Functions
    
//    func setFavoriteImage(row: Int? , isFavorite: Bool, button: UIButton){
//        if isFavorite{
//            button.setImage(K.isFavoriteImage, for: .normal)
//        }else{
//            button.setImage(K.notFavoriteImage, for: .normal)
//        }
//    }
}


