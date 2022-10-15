//
//  AddOrDeleteFavorite.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 12/10/2022.
//

import Foundation

// MARK: - AddOrDelFavorie
struct AddOrDelFavorie: Codable{
    var favorite: FavoData?
    
    enum CodingKeys: String, CodingKey {
        case favorite = "data"
        
    }
}


// MARK: - FavoData
struct FavoData: Codable {
    let id: Int
    var product: Product?
}



