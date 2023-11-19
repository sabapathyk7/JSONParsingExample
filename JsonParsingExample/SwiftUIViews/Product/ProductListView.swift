//
//  ProductListView.swift
//  JsonParsingExample
//
//  Created by kanagasabapathy on 12/11/23.
//

import SwiftUI

struct ProductListView: View {
    @State var products: [Product]
    var body: some View {

        NavigationStack{
            NavigationLink(destination: NewProductView()) { Text("Add New Product")
            }
            List {
                ForEach(products, id: \.id) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        ProductRowView(product: product)

                    }
                }
            }
            .listStyle(.plain)
                .padding()
        }
    }
}

#Preview {
    ProductListView(products: Product.allProduct)
}
