//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/15/24.
//

import SwiftUI

struct PokemonTypeView: View {
    
    var pokemonType: String
    
    init(pokemonType: String) {
        self.pokemonType = pokemonType
    }
    
    var body: some View {
        Text(pokemonType)
            .foregroundColor(Color.white)
            .padding(.init(top: 5, leading: 15, bottom: 5, trailing: 15))
            .background {
                Rectangle()
                    .foregroundColor(getColorFromType(type: pokemonType))
                    .cornerRadius(30)
            }
    }
}

#Preview {
    PokemonTypeView(pokemonType: "fire")
}
