//
//  ShowcaseView.swift
//  MyPokemon
//
//  Created by Georgios Stamelakis on 17/12/23.
//

import SwiftUI

struct Pokemon: Identifiable, Decodable {
    let id: Int
    let name: String
    let sprites: Sprites

    private enum CodingKeys: String, CodingKey {
        case id, name, sprites
    }
}

struct Sprites: Decodable {
    let frontDefault: String

    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}


class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []

    init() {
        fetchPopularPokemon()
    }

    func fetchPopularPokemon() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=10") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.pokemons = result.results
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}

struct PokemonListResponse: Decodable {
    let results: [Pokemon]
}

struct ShowcaseView: View {
    @ObservedObject private var viewModel = PokemonViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Showcase for Popular Pokemon")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.pokemons) { pokemon in
                        PokemonCardView(pokemon: pokemon)
                    }
                }
                .padding()
            }
        }
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
        .padding()
    }
}

struct PokemonCardView: View {
    var pokemon: Pokemon

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Pokemon Card Content
            Text(pokemon.name.capitalized)
                .font(.headline)
                .fontWeight(.bold)

            AsyncImage(url: URL(string: pokemon.sprites.frontDefault)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                case .empty:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                case .failure:
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                        .foregroundColor(.red)
                @unknown default:
                    fatalError()
                }
            }
        }
        .frame(width: 150)
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(12)
    }
}

struct ShowcaseView_Previews: PreviewProvider {
    static var previews: some View {
        ShowcaseView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
