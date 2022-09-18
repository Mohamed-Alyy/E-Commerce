//
//  UiimageView + SetImageFromUrlString.swift
//  Twuiq Final Project
//
//  Created by Mohamed Ali on 22/08/2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageFromUrl (stringUrl: String) {
        
        if let imageUrl = URL(string: stringUrl) {
            let imageData = try? Data(contentsOf: imageUrl)
            self.image = UIImage(data: imageData!)
        }
    }
    
    func circelImage (borderWidth: CGFloat? = 1) {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.layer.frame.height / 2
        self.layer.borderWidth = borderWidth
        self.clipsToBounds = true
    }

}

