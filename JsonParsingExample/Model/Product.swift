//
//  Product.swift
//  JsonParsingExample
//
//  Created by kanagasabapathy on 09/11/23.
//

import Foundation

/*
 Decodable: A type that can decode itself from an external representation.
 Encodable: A type that can encode itself to an external representation.
 Codable (Decodable + Encodable): A type that can convert itself into and out of an external representation.
 */

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String?
    let thumbnail: String
    let images: [String]
}

extension Product {
    static let allProduct: [Product] = Bundle.main.decodeJSON(file: "products.json")
    static let dummyProduct: Product = allProduct[0]
}
var newProduct = [
    Product(id: 32, title: "iPhone 15", description: "An apple mobile which is nothing like apple", price: 549, discountPercentage: 12.96, rating: 4.69, stock: 94, brand: "Apple", category: "smartphones", thumbnail: "https://i.dummyjson.com/data/products/1/thumbnail.jpg", images: [
                "https://i.dummyjson.com/data/products/1/1.jpg",
                "https://i.dummyjson.com/data/products/1/2.jpg",
                "https://i.dummyjson.com/data/products/1/3.jpg",
                "https://i.dummyjson.com/data/products/1/4.jpg",
                "https://i.dummyjson.com/data/products/1/thumbnail.jpg"]),
    Product(id: 33, title: "iPhone 15", description: "An apple mobile which is nothing like apple", price: 549, discountPercentage: 12.96, rating: 4.69, stock: 94, brand: "Apple", category: "smartphones", thumbnail: "https://i.dummyjson.com/data/products/1/thumbnail.jpg", images: [
                "https://i.dummyjson.com/data/products/1/1.jpg",
                "https://i.dummyjson.com/data/products/1/2.jpg",
                "https://i.dummyjson.com/data/products/1/3.jpg",
                "https://i.dummyjson.com/data/products/1/4.jpg",
                "https://i.dummyjson.com/data/products/1/thumbnail.jpg"])
]

struct Person: Codable {
    let name: String
    let age: Int
    let gender: String
    let sign: String
    let partner: String?
    let isEmployed: Bool
}
// Create an Person array for encoding
var people = [
    Person(name: "Robin", age: 30, gender: "Male", sign: "Sagittarius", partner: "Luna", isEmployed: false),
    Person(name: "Emily", age: 35, gender: "Female", sign: "Sagittarius", partner: "John", isEmployed: true)
]
extension Product {
    static func encodePersonObjToJSON() -> String? {
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(newProduct)
            guard let encodedString = String(data: jsonData, encoding: .utf8) else {
                return nil
            }
            return encodedString
        } catch {

        }
        return ""
    }
}

extension Bundle {
    func decodeJSON<T: Decodable>(file: String) -> T {
        print("fileName \(file)")
        let data: Data
        var decodedData: T
        guard let file = Bundle.main.url(forResource: file, withExtension: nil)
        else {
            fatalError("Couldn't find \("MessageData.json") in main bundle.")
        }
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \("MessageData.json") from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            decodedData =  try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            fatalError("Couldn't parse \(file) as \(T.self):\n\(error)")
        }
    }

    // Write data to JSON
       func write<T: Codable>(array: [T], filename: String) {
   //        var array1 = array
   //        array1 = []
           // get file URL
           var file: URL
           do {
               file = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                   .appendingPathComponent(filename)
           } catch {
               fatalError("Coudn't read or create \(filename): \(error.localizedDescription)")
           }

           // encode the array with new entry and write to JSON file
           let encoder = JSONEncoder()
           encoder.outputFormatting = .prettyPrinted
           do {
               print("Writing...  📖: \(file.description)")
               try encoder.encode(array).write(to: file)
           } catch {
               print("Couldn’t save new entry to \(filename), \(error.localizedDescription)")
           }
       }
//    func encodeJson(file: String) {
//
//        guard let file = Bundle.main.url(forResource: "\(file)", withExtension: nil)
//        else {
//            fatalError("Couldn't find file in main bundle.")
//        }
//        do {
//            let encoder = JSONEncoder()
//            encoder.outputFormatting = .prettyPrinted
//            if let jsonData = newProduct.data(using: .utf8),
//                let documentDirectory = FileManager.default.urls(for: .documentDirectory,
//                                                                 in: .userDomainMask).first {
//                let pathWithFileName = documentDirectory.appendingPathComponent("products")
//                do {
//                    try jsonData.write(to: pathWithFileName)
//                } catch {
//                    // handle error
//                }
//            }
//
////            
////            let fileURL = try FileManager.default
////                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
////                .appendingPathComponent("newproducts.json")
////
////            try encoder.encode(newProduct)
////                .write(to: fileURL)
//
//        } catch {
//            fatalError("Couldn't find file in main bundle.\(error)")
//        }
//    }
}



