//
//  ViewController.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 04/10/2022.
//

import UIKit

struct Login: Codable {
    let id: Int?
    let name, email, phone: String?
    let image: String?
    let points, credit: Int?
    let token: String?
}
