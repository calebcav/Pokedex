//
//  PokeDexImage.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/14/24.
//

import SwiftUI

struct PokeDexImage: View {
    
    init (image: String, width: CGFloat, height: CGFloat) {
        self.image = image
        self.width = width
        self.height = height
    }
    var body: some View {
        AsyncImage(url: URL(string: pokemon.sprites.other.official_artwork.front_default)) {
            image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: self.width, height: self.height)
        }
    }
}

#Preview {
    PokeDexImage()
}
