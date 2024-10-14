//
//  File.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/13/24.
//

import Foundation



class PokeDexTableViewModel: ObservableObject {
    @Published var tableViewPokemon: [(Pokemon, Pokemon)] = []
    
    func createListForTableView(pokemon: [PokemonObject]) -> [(Pokemon, Pokemon)] {
        var items: [(Pokemon, Pokemon)] = []
        
        for i in stride(from: 0, to: pokemon.count, by: 2) {
            if i + 1 < pokemon.count {
                let left = fetchSinglePokemon(apiURL: pokemon[i].url)
                let right = fetchSinglePokemon(apiURL: pokemon[i + 1].url)
                items.append((left, right))
            } else {
                // Handle the case where there's an odd number of Pokémon
                let left = fetchSinglePokemon(apiURL: pokemon[i].url)
                items.append((left, Pokemon.mock))
            }
        }
        
        return items
    }
    
    func fetchSinglePokemon(apiURL: String) -> Pokemon {
        
        var pokemon: Pokemon?
        
        guard let url = URL(string: apiURL) else {
            print("Invalid URL")
            return Pokemon.mock
        }
        
        let request = URLRequest(url: url)
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                semaphore.signal()
                return
            }
            
            guard let data, !data.isEmpty else {
                print("No data returned")
                semaphore.signal()
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Pokemon.self, from: data)
                pokemon = response
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
            semaphore.signal()
        }
        
        dataTask.resume()
        semaphore.wait()
        
        guard let pokemon else {
            return Pokemon.mock
        }
        
        return pokemon
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
