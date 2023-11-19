//
//  ProductDetailView.swift
//  JsonParsingExample
//
//  Created by kanagasabapathy on 12/11/23.
//

import SwiftUI

struct ProductDetailView: View {
    let columns = [
        GridItem(.flexible())]

    @State var product: Product
    var body: some View {
        Text(product.description)
            .font(.caption2)
            .bold()
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 20.0) {
                ForEach(product.images, id: \.self) { image in
                    AsyncImage(url: URL(string: image)) { asyncImage in
                        asyncImage.resizable()
                            .frame(width: 300, height: 300)
                            .aspectRatio(0.5, contentMode: .fit)
                            .clipShape(Rectangle())
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(product.title)
                    .font(.title3)
                    .bold()
                    .frame(alignment: .leading)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {

                } label: {
                    Text("$\(product.price)")
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}


#Preview {
    ProductDetailView(product: Product.dummyProduct)
}
