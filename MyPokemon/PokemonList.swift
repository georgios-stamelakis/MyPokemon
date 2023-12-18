//
//  PokemonList.swift
//  MyPokemon
//
//  Created by Georgios Stamelakis on 18/12/23.
//

import Foundation

struct PokemonList: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonResult]

    private enum CodingKeys: String, CodingKey {
        case count, next, previous, results
    }
}

struct PokemonResult: Decodable {
    let name: String
    let url: String

    private enum CodingKeys: String, CodingKey {
        case name, url
    }
}
