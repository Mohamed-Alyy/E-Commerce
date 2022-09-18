//
//  MessagesTableViewCell.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 12/09/2022.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    
    // MARK: - OUtlets
    
    @IBOutlet weak var messegesBgView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func layoutSubviews() {
        Helper.customViews(views: [messegesBgView], cornerRadius: nil)
        makeImageCircle(image: profileImageView)
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func makeImageCircle(image: UIImageView){
        image.layer.borderWidth = 1
        //image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2
        //image.clipsToBounds = true
    }
}
