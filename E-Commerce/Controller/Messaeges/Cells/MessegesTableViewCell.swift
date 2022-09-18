//
//  ChatTableViewCell.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 13/09/2022.
//

import UIKit

class MessegesTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var messegeStackView: UIStackView!
    @IBOutlet weak var chatBgView: UIView!
    @IBOutlet weak var chatMessegLBL: UILabel!
    
    
    override func layoutSubviews() {
        Helper.customViews(views: [chatBgView], cornerRadius: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
