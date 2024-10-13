//
//  File.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/13/24.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let url: String
}

struct PokemonResponse: Codable {
    let results: [Pokemon]
}

class PokeDexTableViewModel: ObservableObject {
    @Published var tableViewPokemon: [(String, String)] = []
    
    func createListForTableView(pokemon: [Pokemon]) -> [(String, String)] {
        var items: [(String, String)] = []
        
        for i in stride(from: 0, to: pokemon.count, by: 2) {
            if i + 1 < pokemon.count {
                items.append((pokemon[i].name, pokemon[i + 1].name))
            } else {
                // Handle the case where there's an odd number of Pokémon
                items.append((pokemon[i].name, ""))
            }
        }
        
        return items
    }
    
    func fetchPokemon() {
        
        // Step 1: Create the URL
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=20&offset=0") else {
            print("Invalid URL")
            return
        }
        
        // Step 2: Create a URL Request
        let request = URLRequest(url: url)
        
        
        // Step 3: Use URLSession to create a data task
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            // Step 4: Handle the response and errors
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                
                // Decode the JSON response
                let decoder = JSONDecoder()
                let response = try decoder.decode(PokemonResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.tableViewPokemon = self.createListForTableView(pokemon: response.results)
                }
                

                
            } catch {
                print(data.count)
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }

        // Step 5: Start the data task
        dataTask.resume()
    }
}
