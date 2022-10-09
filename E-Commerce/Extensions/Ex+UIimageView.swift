//
//  Ex+UIimageView.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 09/10/2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(url: String , placeHolder: String = "placeHolder"){
        guard let imageUrl = URL(string: url) else {return}
       // let imageSoucres = ImageResource(downloadURL: imageUrl, cacheKey: url)
        let imagePlaceHolder = UIImage(named: placeHolder)
        kf.setImage(with: imageUrl, placeholder: imagePlaceHolder, options: [
            .transition(.fade(1)),
            .cacheOriginalImage
        ])
    }
}
