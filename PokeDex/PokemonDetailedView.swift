//
//  PokemonDetailedView.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/16/24.
//

import SwiftUI

struct PokemonDetailedView: View {
    
    var pokemon: Pokemon
    
    @Environment(\.presentationMode) var presentationMode
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        ZStack {
            Color(getColorFromType(type: pokemon.types[0].type.name).opacity(0.7))
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    HStack {
                        Text(pokemon.name)
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    HStack {
                        PokemonTypeView(pokemonType: pokemon.types[0].type.name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                }
                .padding(.leading, 30)
                
                PokeDexImage(imageURL: pokemon.sprites.other?.officialArtwork.frontDefault ?? "", width: 250, height: 250)
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, 50)
        }
        .navigationBarBackButtonHidden(true)
        // Hide the default back button
                .navigationBarItems(leading: Button(action: {
                    // Action to go back (for example, dismissing the view)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                    }
                })
        
    }
}

#Preview {
    PokemonDetailedView(pokemon: Pokemon.mock)
}
