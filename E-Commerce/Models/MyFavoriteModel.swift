//
//  MyBagModel.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 22/09/2022.
//

import Foundation

struct MyFavoriteModel {
    var id: Int
    var price: Int
    var title: String
    var image: String
    var description: String
    var isInBag: Bool = false
    
    init(id: Int, price: Int , title: String, image: String, description: String, isInBag: Bool = false){
        self.id = id
        self.price = price
        self.title = title
        self.image = image
        self.description = description
        self.isInBag = isInBag
    }
    
}
