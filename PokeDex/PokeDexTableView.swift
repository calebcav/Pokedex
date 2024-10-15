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
        List(viewModel.tableViewPokemon, id: \.0) { item in
            HStack {
                PokeDexTableViewCell(pokemon: item.0)
                Spacer()
                PokeDexTableViewCell(pokemon: item.1)
                    
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
