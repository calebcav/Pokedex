//
//  PokemonAboutView.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/20/24.
//

import SwiftUI


struct Row: View {
    
    let key: String
    let value: String
    
    init(key: String, value: String) {
        self.key = key
        self.value = value
    }
    
    var body: some View {
        HStack {
            Text(key)
                .foregroundStyle(.secondary)
            Text(value)
        }
        .padding(.bottom, 10)
    }
}

struct PokemonAboutView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Row(key: "Species", value: "Lizard")
            Row(key: "Height", value: "1.80 m")
            Row(key: "Weight", value: "7.9 kg")
            Row(key: "Abilities", value: "Blaze")
            
            Text("Breeding")
                .bold()
                .padding(.vertical, 10)
            
            Row(key: "Gender", value: "Male")
            Row(key: "Egg Group", value: "Monster")
            Row(key: "Egg Cycle", value: "Fire")
            
        }
    }
}

#Preview {
    PokemonAboutView()
}
