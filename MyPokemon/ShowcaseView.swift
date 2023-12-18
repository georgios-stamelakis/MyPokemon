//
//  ShowcaseView.swift
//  MyPokemon
//
//  Created by Georgios Stamelakis on 17/12/23.
//

import SwiftUI

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

            AsyncImage(url: URL(string: pokemon.sprite ?? "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png")) { phase in
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
