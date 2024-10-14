//
//  PokeDexTableViewCell.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/13/24.
//

import SwiftUI

struct Pokemon: Decodable {
    
}

struct PokeDexTableViewCell: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 200, height: 200)
                .cornerRadius(15)
            Text("Name")
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .padding()
            
        }
    }
}

#Preview {
    PokeDexTableViewCell()
}
