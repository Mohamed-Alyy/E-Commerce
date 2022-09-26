//
//  GridCollectionViewCell.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 11/09/2022.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell  {

    // MARK: - OUTLETS
    
    @IBOutlet weak var produtsTitlLBL: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var descriptionLBL: UILabel!
    @IBOutlet weak var priceLBL: UILabel!
    
    @IBOutlet weak var gridCollectionBgView: UIView!
    @IBOutlet weak var favoriteBtn: UIButton!
    
    @IBOutlet weak var xBtnOutlet: UIButton!
    
    
    var cellRow: Int?
    
        
    override func layoutSubviews() {
        Helper.customViews(views: [gridCollectionBgView], cornerRadius: 0.03)
    }
    
    var favoriteBtnTappedClousre: ((_ row:Int)->Void)?
    
    
    @IBAction func favoriteBtnPressed(_ sender: UIButton) {
        guard cellRow != nil else {return}
        favoriteBtnTappedClousre?(cellRow!)
}

    
    @IBAction func xBtnPressed(_ sender: UIButton) {
        
    }
    
    
    
}
