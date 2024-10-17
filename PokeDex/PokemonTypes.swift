//
//  PokemonTypes.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/14/24.
//

import Foundation

struct PokemonTypeItem: Decodable {
    var name: String
    var url: String
}

struct PokemonType: Decodable, Hashable {
    var slot: Int
    var type: PokemonTypeItem
}

extension PokemonType: Equatable {
    static var mock: PokemonType {
        .init(slot: 1, type: PokemonTypeItem(name: "fire", url: "https://pokeapi.co/api/v2/type/10/"))
    }
    
    static func == (lhs: PokemonType, rhs: PokemonType) -> Bool {
        lhs.slot == rhs.slot
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(slot)
    }
    
}

struct Other: Codable {
    let officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable {
    let frontDefault, frontShiny: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}



class Sprites: Codable {
    let backDefault: String
    let backShiny: String
    let frontDefault: String
    let frontShiny: String
    let other: Other?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case other
    }

    init(backDefault: String, backShiny: String, frontDefault: String, frontShiny: String, other: Other?) {
        self.backDefault = backDefault
        self.backShiny = backShiny
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
        self.other = other
    }
}

extension Sprites {
    
    static var mock: Sprites {
        .init(backDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/4.png", backShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/4.png", frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png", frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/4.png", other: Other(officialArtwork: OfficialArtwork(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png", frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/4.png")))
    }
}

struct Pokemon: Decodable, Hashable {
    let id: Int
    var types: [PokemonType]
    let name: String
    let sprites: Sprites
}

extension Pokemon: Equatable {
    static var mock: Pokemon {
        .init(id: 1, types: [PokemonType.mock], name: "charmander", sprites: Sprites.mock)
    }
    
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct PokemonObject: Codable {
    let name: String
    let url: String
}

struct PokemonResponse: Codable {
    let results: [PokemonObject]
}
