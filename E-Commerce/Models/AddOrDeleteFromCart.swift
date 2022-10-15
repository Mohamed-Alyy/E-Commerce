//
//  AddOrDeleteFromCart.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 14/10/2022.
//

import Foundation

//struct AddOrDeleteFromCart : Codable {
//    let status: Bool
//    let message: String
//    //let data = CartProduct?
//}
//
//struct CartProduct: Codable{
//    let id: Int
//    var product: Product?
//}


// MARK: - AddOrDeletFromCart
struct AddOrDeletFromCart: Codable {
    let status: Bool
    let message: String
    let data: CartDatam
}

// MARK: - DataClass
struct CartDatam: Codable {
//    let id: Int
    let product: ProductCart?
}

// MARK: - Product
struct ProductCart: Codable {
    let id: Int
   
}
