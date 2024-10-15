//
//  PokeDexTableViewCell.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/13/24.
//

import SwiftUI

struct PokeDexTableViewCell: View {
    
    var pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        VStack {
            
            Text(pokemon.name)
                .font(.headline)
                .bold()
                .foregroundColor(.black)
                .padding()
            
            PokeDexImage(imageURL: pokemon.sprites.front_default, width: 100, height: 100)
            
        }.padding()
            .frame(width: 200, height: 200)
            .background {
                Rectangle()
                    .foregroundColor(getColorFromType(type: pokemon.types[0].type.name).opacity(0.5))
                    .cornerRadius(15)
            }
    }
}

#Preview {
    PokeDexTableViewCell(pokemon: Pokemon.mock)
}
