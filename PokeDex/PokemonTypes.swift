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

struct PokemonType: Decodable {
    var slot: Int
    var type: PokemonTypeItem
}

extension PokemonType {
    static var mock: PokemonType {
        .init(slot: 1, type: PokemonTypeItem(name: "Fire", url: "https://pokeapi.co/api/v2/type/10/"))
    }
}

struct PokemonOfficialArtwork: Decodable {
    let front_default: String
}

struct PokemonSpritesOther: Decodable {
    let official_artwork: PokemonOfficialArtwork
}

struct PokemonSprites: Decodable {
    let front_default: String
    let other: PokemonSpritesOther
}

extension PokemonSprites {
    static var mock: PokemonSprites {
        .init(front_default: "", other: .init(official_artwork: .init(front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png")))
    }
}

struct Pokemon: Decodable {
    let id: Int
    var types: [PokemonType]
    let name: String
    let sprites: PokemonSprites
}

extension Pokemon {
    static var mock: Pokemon {
        .init(id: 1, types: [PokemonType.mock], name: "Charmander", sprites: PokemonSprites.mock)
    }
}

struct PokemonObject: Codable {
    let name: String
    let url: String
}

struct PokemonResponse: Codable {
    let results: [PokemonObject]
}
