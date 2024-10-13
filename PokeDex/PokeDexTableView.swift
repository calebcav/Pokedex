//
//  PokeDexTableView.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/13/24.
//

import SwiftUI

struct PokeDexTableView: View {
    
    let items: [(String, String)] = [
        ("Row 1 - Column 1", "Row 1 - Column 2"),
        ("Row 2 - Column 1", "Row 2 - Column 2"),
        ("Row 3 - Column 1", "Row 3 - Column 2"),
    ]
    
    var body: some View {
        List(items, id: \.0) { item in
            HStack {
                Text(item.0) // Column 1
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(item.1) // Column 2
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .navigationTitle("Table View")
    }
}

#Preview {
    PokeDexTableView()
}
