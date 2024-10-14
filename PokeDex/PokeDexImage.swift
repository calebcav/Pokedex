//
//  PokeDexImage.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/14/24.
//

import SwiftUI

struct PokeDexImage: View {
    
    var imageURL: String
    var width: CGFloat
    var height: CGFloat
    
    init (imageURL: String, width: CGFloat, height: CGFloat) {
        self.imageURL = imageURL
        self.width = width
        self.height = height
    }
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: self.width, height: self.height)
            case .failure(_):
                // Handle error case
                Text("Error loading image")
            case .empty:
                // Show placeholder while loading
                ProgressView()
            @unknown default:
                // Handle unknown cases
                EmptyView()
            }
        }
    }
}

#Preview {
    PokeDexImage(imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png", width: 50, height: 50)
}
