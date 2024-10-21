//
//  PokemonTabViewModel.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/19/24.
//

import Foundation
import SwiftUI

class PokemonTabViewModel: ObservableObject {
    @Published var selection: Int = 0
    @Published var view: any View = PokemonAboutView()
}
