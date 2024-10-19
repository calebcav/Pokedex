//
//  PokemonTabView.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/19/24.
//

import SwiftUI

struct PokemonTabView: View {
    
    @StateObject private var viewModel = PokemonTabViewModel()
    
    var body: some View {
        HStack(alignment: .top) {
            Button(action: {
                viewModel.selection = 0
            }) {
                Text("About")
                    .foregroundStyle(Color.black)
                    .underline(viewModel.selection == 0, color: Color.blue)
            }
            Button(action: {
                viewModel.selection = 1
            }) {
                Text("Base Stats")
                    .foregroundStyle(Color.black)
                    .underline(viewModel.selection == 1, color: Color.blue)
                
            }
            Button(action: {
                viewModel.selection = 2
            }) {
                Text("Evolution")
                    .foregroundStyle(Color.black)
                    .underline(viewModel.selection == 2, color: Color.blue)
            }
            Button(action: {
                viewModel.selection = 3
            }) {
                Text("Moves")
                    .foregroundStyle(Color.black)
                    .underline(viewModel.selection == 3, color: Color.blue)
            }
        }
    }
}

#Preview {
    PokemonTabView()
}
