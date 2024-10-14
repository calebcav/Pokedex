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
        ZStack(alignment: .topLeading) {
            Text(pokemon.name)
                .font(.headline)
                .bold()
                .foregroundColor(.white)
                .padding()
            
        }.padding()
            .background {
                Rectangle()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 200)
                    .cornerRadius(15)
            }
    }
}

#Preview {
    PokeDexTableViewCell(pokemon: Pokemon.mock)
}
