//
//  PokemonDetails.swift
//  MyPokemon
//
//  Created by Georgios Stamelakis on 18/12/23.
//

import Foundation

struct PokemonDetails: Decodable {
    let id: Int
    let name: String
    let sprites: SpritesDetails

    private enum CodingKeys: String, CodingKey {
        case id, name, sprites
    }
}

struct SpritesDetails: Decodable {
    let other: OtherSprites?

    private enum CodingKeys: String, CodingKey {
        case other
    }
}

struct OtherSprites: Decodable {
    let officialArtwork: OfficialArtwork?

    private enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}


struct OfficialArtwork: Decodable {
    let frontDefault: String?

    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
