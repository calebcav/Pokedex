//
//  PokemonDetailedView.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/16/24.
//

import SwiftUI

struct PokemonDetailedView: View {
    
    @State var pokemon: Pokemon
    @State var pokemonTypes: [PokemonType]
    
    @Environment(\.presentationMode) var presentationMode
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.pokemonTypes = pokemon.types
    }
    
    var body: some View {
        ZStack {
            Color(getColorFromType(type: pokemon.types[0].type.name).opacity(0.7))
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    HStack {
                        Text((pokemon.name).capitalized)
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                    }
                    VStack {
                        ForEach(pokemonTypes, id: \.self) { type in
                            PokemonTypeView(pokemonType: type.type.name)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
                
                VStack {
                    PokemonTabView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background {
                    Rectangle()
                        .fill(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.top, UIScreen.main.scale * 60)
                        .ignoresSafeArea(.all)
                }
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, 100)
            
            
            
            
            
//            .clipShape(RoundedRectangle(cornerRadius: 30))
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//            .cornerRadius(30)
//            .background(Color.white)
//            .padding(.top, (UIScreen.main.bounds.height / 2) - 50)
            
            
            PokeDexImage(imageURL: pokemon.sprites.other?.officialArtwork.frontDefault ?? "", width: 250, height: 250)
                .padding(.bottom, 200)
            
        }
        .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action: {
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
