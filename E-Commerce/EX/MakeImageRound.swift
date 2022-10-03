//
//  MakeImageRound.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 12/09/2022.
//

import UIKit


extension UIImageView {
    
    func makeRounded() {
        
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}

