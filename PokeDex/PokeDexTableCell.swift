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
            
            Text(pokemon.name)
                .font(.headline)
                .bold()
                .foregroundColor(.black)
                .padding()
            HStack {
                VStack(alignment: .leading) {
                    PokemonTypeView(pokemonType: pokemonType[0].type.name).frame(width: 100)
                }
                PokeDexImage(imageURL: pokemon.sprites.other?.officialArtwork.frontDefault ?? "", width: 100, height: 100)
            }
            
            
        }.padding()
            .frame(width: 200, height: 200)
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
