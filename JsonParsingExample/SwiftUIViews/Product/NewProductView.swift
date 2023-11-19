//
//  NewProductView.swift
//  JsonParsingExample
//
//  Created by kanagasabapathy on 12/11/23.
//

import SwiftUI

struct NewProductView: View {
    private let encodedString = Product.encodePersonObjToJSON()
    var body: some View {
        Text(encodedString ?? "")
            .bold()
            .frame(alignment: .center)
        Button("Submit") {
            write(array: newProduct, filename: "newproduct.json")

        }
    }
    // Write data to JSON
       func write<T: Codable>(array: [T], filename: String) {
           var file: URL
           do {
               file = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                   .appendingPathComponent(filename)
           } catch {
               fatalError("Coudn't read or create \(filename): \(error.localizedDescription)")
           }
           let encoder = JSONEncoder()
           encoder.outputFormatting = .prettyPrinted
           do {
               try encoder.encode(array).write(to: file)
           } catch {
               print("Couldn’t save new entry to \(filename), \(error.localizedDescription)")
           }
       }
}

#Preview {
    NewProductView()
}
