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
            VStack(alignment: .leading) {
                Text(pokemon.name)
                    .bold()
                HStack {
                    PokemonTypeView(pokemonType: pokemon.types[0].type.name)
                }
            }
        }
    }
}

#Preview {
    PokemonDetailedView(pokemon: Pokemon.mock)
}
