//
//  ContentView.swift
//  JsonParsingExample
//
//  Created by kanagasabapathy on 01/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var products: [Product] = Product.allProduct
    var body: some View {
        ProductListView(products: products)
    }
}

#Preview {
    ContentView(products: [Product.dummyProduct])
}
