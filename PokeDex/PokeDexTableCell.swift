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
        ZStack {
            PokeDexImage(imageURL: pokemon.sprites.front_default, width: 100, height: 100)
                .padding()

            
                Spacer()
                Text(pokemon.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            
            
            
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
