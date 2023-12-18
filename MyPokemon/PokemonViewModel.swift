//
//  PokemonViewModel.swift
//  MyPokemon
//
//  Created by Georgios Stamelakis on 18/12/23.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []

    init() {
        fetchPokemonList()
    }

    func fetchPokemonList() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(PokemonList.self, from: data)
                    DispatchQueue.main.async {
                        self.fetchPokemonDetails(pokemonList: result.results)
                    }
                } catch {
                    print("Error decoding Pokemon list: \(error)")
                }
            }
        }.resume()
    }

    func fetchPokemonDetails(pokemonList: [PokemonResult]) {
        for pokemonResult in pokemonList {
            guard let url = URL(string: pokemonResult.url) else { continue }

            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    do {
                        let pokemonDetails = try JSONDecoder().decode(PokemonDetails.self, from: data)
                        DispatchQueue.main.async {
                            let pokemon = Pokemon(id: pokemonDetails.id, name: pokemonResult.name, sprite: pokemonDetails.sprites.other?.officialArtwork?.frontDefault)
                            self.pokemons.append(pokemon)
                        }
                    } catch {
                        print("Error decoding Pokemon details: \(error)")
                    }
                }
            }.resume()
        }
    }

}
