//
//
//import Foundation
//
//// MARK: - Products
//struct Products: Codable {
//    let data: [Product]
//
//    enum CodingKeys: String, CodingKey {
//        case data = "data"
//    }
//}
//
//// MARK: - Datum
//struct Product: Codable {
//    let id: Int
//    let price, oldPrice: Double
//    let discount: Int
//    let image: String
//    let name, datumDescription: String
//    let images: [String]
//    let inFavorites, inCart: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case id, price
//        case oldPrice = "old_price"
//        case discount, image, name
//        case datumDescription = "description"
//        case images
//        case inFavorites = "in_favorites"
//        case inCart = "in_cart"
//    }
//}
//
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let products = try? newJSONDecoder().decode(Products.self, from: jsonData)

import Foundation

// MARK: - Products
struct Products: Codable {
    let status: Bool
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    
    let products: [Product]

    enum CodingKeys: String, CodingKey {
        case products = "data"
    }
}

// MARK: - Datum
struct Product: Codable {
    let id: Int
    let price, oldPrice: Double
    let discount: Int
    let image: String
    let name, datumDescription: String
    let images: [String]
    let inFavorites, inCart: Bool

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image, name
        case datumDescription = "description"
        case images
        case inFavorites = "in_favorites"
        case inCart = "in_cart"
    }
}

