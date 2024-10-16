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
            .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
            .frame(width: .infinity, height: .infinity)
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
