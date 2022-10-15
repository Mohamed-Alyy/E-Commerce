//
//  MyCartModel.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 13/10/2022.
//

import Foundation



// MARK: - MyCartModel
struct MyCartModel: Codable {
    let status: Bool
    let data: CartData
}

// MARK: - DataClass
struct CartData: Codable {
    var cartItems: [CartItem]
    let subTotal, total: Double

    enum CodingKeys: String, CodingKey {
        case cartItems = "cart_items"
        case subTotal = "sub_total"
        case total
    }
}

// MARK: - CartItem
struct CartItem: Codable {
    let id, quantity: Int
    let product: Product
}

//// MARK: - Product
//struct Product: Codable {
//    let id, price, oldPrice, discount: Int
//    let image: String
//    let name, productDescription: String
//    let images: [String]
//    let inFavorites, inCart: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case id, price
//        case oldPrice = "old_price"
//        case discount, image, name
//        case productDescription = "description"
//        case images
//        case inFavorites = "in_favorites"
//        case inCart = "in_cart"
//    }
//}
