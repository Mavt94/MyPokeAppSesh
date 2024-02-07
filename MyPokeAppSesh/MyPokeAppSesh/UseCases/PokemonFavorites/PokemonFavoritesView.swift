//
//  PokemonFavoritesView.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 6/2/24.
//

import SwiftUI
import SwiftData

struct PokemonFavoritesView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var dataItems: [PokemonDetailData]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(dataItems, id: \.id) { item in
                    NavigationLink {
                        PokemonDetailView(model: PokemonModel.Pokemon(item: item.toResponseModel()))
                    } label: {
                        PokemonCellView(model: PokemonModel.Pokemon(item: item.toResponseModel()))
                    }
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

