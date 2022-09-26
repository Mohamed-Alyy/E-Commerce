//
//  FavoriteCollectionViewCell.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 22/09/2022.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bagImage: UIImageView!
    @IBOutlet weak var bagTitleLBL: UILabel!
    @IBOutlet weak var bagDescriptionLBL: UILabel!
    @IBOutlet weak var bagPriceLBL: UILabel!
    @IBOutlet weak var bagBtnOutlet: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBAction func xBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func bagBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
}
