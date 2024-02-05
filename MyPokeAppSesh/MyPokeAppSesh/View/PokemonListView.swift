//
//  PokemonListView.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import SwiftUI

struct PokemonListView: View {
    
    @StateObject var viewModel: PokemonListViewModel = PokemonListViewModel()
    
    var body: some View {
        VStack {
            content
        }.onAppear {
            viewModel.onAppear()
        }.onDisappear {
            viewModel.onDisappear()
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch viewModel.state {
        case .idle:
            Text("")
                .onAppear {
                    viewModel.loadViewModel()
                }
        case .loading:
            Text("Loading")
        case let .loaded(model):
            NavigationView {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(model.rows, id: \.id) { row in
                            NavigationLink {
                                DetailPokemon(model: row)
                            } label: {
                                PokemonCellView(model: row)
                            }
                        }
                    }
                    .padding(.horizontal, 8)
                }
            }
        case .error(let error):
            Text(error.localizedDescription)
        }
        
    }
}

#Preview {
    PokemonListView()
}
