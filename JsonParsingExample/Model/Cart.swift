//
//  Cart.swift
//  JsonParsingExample
//
//  Created by kanagasabapathy on 11/11/23.
//

import Foundation

// MARK: - Carts
struct Carts: Decodable {
    let carts: [Cart]
    let total, skip, limit: Int
}

// MARK: - Cart
struct Cart: Decodable {
    let id: Int
    let products: [Product]
    let total, discountedTotal, userID, totalProducts: Int
    let totalQuantity: Int

    enum CodingKeys: String, CodingKey {
        case id, products, total, discountedTotal
        case userID = "userId"
        case totalProducts, totalQuantity
    }
}
