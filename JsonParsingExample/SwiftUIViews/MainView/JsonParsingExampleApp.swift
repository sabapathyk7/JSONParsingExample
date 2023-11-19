//
//  JsonParsingExampleApp.swift
//  JsonParsingExample
//
//  Created by kanagasabapathy on 01/11/23.
//

import SwiftUI

@main
struct JsonParsingExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(products: Product.allProduct)
        }
    }
}
