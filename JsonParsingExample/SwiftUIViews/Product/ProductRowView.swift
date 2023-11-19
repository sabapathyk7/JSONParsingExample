//
//  ProductRowView.swift
//  JsonParsingExample
//
//  Created by kanagasabapathy on 12/11/23.
//

import SwiftUI

struct ProductRowView: View {
    @State var product: Product
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.thumbnail )) { image in
                image.resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(0.5, contentMode: .fit)
                    .clipShape(Rectangle())
            } placeholder: {
                ProgressView()
            }
            Text(product.title)
        }
    }
}

#Preview {
    ProductRowView(product: Product.dummyProduct)
}
