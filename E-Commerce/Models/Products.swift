
import Foundation

// MARK: - Products
struct Products: Codable {
    let status: Bool
    let data: DataClass
    
}

// MARK: - DataClass
struct DataClass: Codable {
    
    var products: [Product]

    enum CodingKeys: String, CodingKey {
        case products = "data"
    }
}

// MARK: - Datum
struct Product: Codable {
    let id: Int
    let price: Double
    let oldPrice: Double
    let discount: Int
    let image: String
    let name, description: String
    let images: [String]?
    var inFavorites, inCart: Bool?

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image, name
        case description
        case images
        case inFavorites = "in_favorites"
        case inCart = "in_cart"
    }
}
