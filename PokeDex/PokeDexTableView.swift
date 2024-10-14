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
                Text(item.0) // Column 1
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(item.1) // Column 2
                    .frame(maxWidth: .infinity, alignment: .center)
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
