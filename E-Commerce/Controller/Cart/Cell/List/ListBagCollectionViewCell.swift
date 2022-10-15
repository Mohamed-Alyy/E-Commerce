//
//  MyBagCollectionViewCell.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 30/09/2022.
//

import UIKit


protocol DeleteFromCartProtocol{
    func didXbuttonTapped(cartRow: Int)
}

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
    
    // MARK: - prooerties
    
    var cartRow = 0
    var delegate: DeleteFromCartProtocol?
    
    // MARK: - Actions
    
    
    @IBAction func plusBtnPressed(_ sender: UIButton) {
        
    }
    
    
    
    @IBAction func minusBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func xButtonPressed(_ sender: UIButton) {
        delegate?.didXbuttonTapped(cartRow: cartRow)
    }
}
