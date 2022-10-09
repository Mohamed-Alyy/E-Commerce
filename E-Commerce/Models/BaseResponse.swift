//
//  BaseResponse.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 08/10/2022.
//

import Foundation
struct BaseResponse <T: Codable> : Codable {
    let status: Bool
    let message: String
    let data: T?
}
