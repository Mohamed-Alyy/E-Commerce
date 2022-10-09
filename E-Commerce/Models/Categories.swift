//
//  Categories.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 09/10/2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let categories = try? newJSONDecoder().decode(Categories.self, from: jsonData)

import Foundation

// MARK: - Categories
struct Categories: Codable {
    let status: Bool
    let data: CategoryData
}

// MARK: - DataClass
struct CategoryData: Codable {
    let categories: [Category]
   

    enum CodingKeys: String, CodingKey {
        case categories = "data"
    }
}

// MARK: - Datum
struct Category: Codable {
    let id: Int
    let name: String
    let image: String
}

