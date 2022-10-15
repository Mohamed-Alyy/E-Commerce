//
//  MyFavModel.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 12/10/2022.
//

import Foundation

struct MyFavoritesModel: Codable {
    let status: Bool
    let data: FavoriteData?
}

struct FavoriteData: Codable {
    let favorites: [MyFavorite]?
    
    enum CodingKeys: String, CodingKey {
        case favorites = "data"
    }
  
}

struct MyFavorite: Codable {
    let id: Int
    var product: Product? 
}

