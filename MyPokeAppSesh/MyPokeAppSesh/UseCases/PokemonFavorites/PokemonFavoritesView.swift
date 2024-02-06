//
//  PokemonFavoritesView.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 6/2/24.
//

import SwiftUI
import SwiftData

struct PokemonFavoritesView: View {
    
    @Query(sort: \PokemonDetailData.id) var models: [PokemonDetailData]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(models, id: \.id) { model in
                    Text(model.name)
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

#Preview {
    PokemonFavoritesView()
}
