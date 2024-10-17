//
//  PokemonDetailedView.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/16/24.
//

import SwiftUI

struct PokemonDetailedView: View {
    var pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        ZStack {
            Color(getColorFromType(type: pokemon.types[0].type.name).opacity(0.7))
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    Text(pokemon.name)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                }
                HStack {
                    PokemonTypeView(pokemonType: pokemon.types[0].type.name)
                        .padding(.leading, 30)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, 50)
        }
    }
}

#Preview {
    PokemonDetailedView(pokemon: Pokemon.mock)
}
