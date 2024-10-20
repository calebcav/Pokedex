//
//  PokeDexTableViewCell.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/13/24.
//

import SwiftUI

struct PokeDexTableViewCell: View {
    
    @State var pokemon: Pokemon
    @State var pokemonType: [PokemonType]
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.pokemonType = pokemon.types
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                Spacer()
            }
            
            HStack {
                VStack(alignment: .leading) {
                    ForEach(pokemonType, id: \.self) { type in
                        PokemonTypeView(pokemonType: type.type.name).frame(width: 100)
                    }
                    
                }
                PokeDexImage(imageURL: pokemon.sprites.other?.officialArtwork.frontDefault ?? "", width: 75, height: 75)
            }
            
            
        }
        .frame(width: 175, height: 175)
        .background {
            Rectangle()
                .foregroundColor(getColorFromType(type: pokemon.types[0].type.name).opacity(0.7))
                .cornerRadius(15)
            }
    }
}

#Preview {
    PokeDexTableViewCell(pokemon: Pokemon.mock)
}
