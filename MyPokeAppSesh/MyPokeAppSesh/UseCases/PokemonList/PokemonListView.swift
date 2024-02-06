//
//  PokemonListView.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import SwiftUI
import SwiftData

struct PokemonListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [PokemonDetailData]
    
    @StateObject var viewModel: PokemonListViewModel = PokemonListViewModel()
    
    var body: some View {
        content
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
            ProgressView()
        case let .loaded(model):
            NavigationView {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(model.rows, id: \.id) { row in
                            NavigationLink {
                                PokemonDetailView(model: row)
                            } label: {
                                PokemonCellView(model: row)
                                    .onAppear {
                                        Task {
                                            await viewModel.loadNextPageIfNeeded(model: model, row: row)
                                        }
                                    }
                            }
                        }
                        if viewModel.loadingList {
                            ProgressView()
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
