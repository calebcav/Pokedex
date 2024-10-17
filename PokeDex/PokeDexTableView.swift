//
//  PokeDexTableView.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/13/24.
//

import SwiftUI

struct PokeDexTableView: View {
    
    @StateObject private var viewModel = PokeDexTableViewModel()
    
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(Array(zip(viewModel.tableViewPokemon.indices, viewModel.tableViewPokemon)), id: \.0) { index, item in
                    HStack {
                        NavigationLink(destination: PokemonDetailedView(pokemon: item.0)) {
                            PokeDexTableViewCell(pokemon: item.0)
                                .clipped()
                        }
                        NavigationLink(destination: PokemonDetailedView(pokemon: item.1)) {
                            PokeDexTableViewCell(pokemon: item.1)
                                .clipped()
                        }
                        
                    }
                }
                
            }
        }
        .navigationTitle("Table View")
        .onAppear {
            viewModel.fetchPokemon()
        }
    }
}

#Preview {
    PokeDexTableView()
}
