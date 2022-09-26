//
//  ProductsModel.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 18/09/2022.
//

import Foundation

struct ProductsModel {
    var id: Int
    var price: Int
    var title: String
    var image: String
    var description: String 
    var isFavorite: Bool = false
    
    init(id: Int, price: Int , title: String, image: String, description: String, isFavorite: Bool = false){
        self.id = id
        self.price = price
        self.title = title
        self.image = image
        self.description = description
        self.isFavorite = isFavorite
    }
    

    
    
}
