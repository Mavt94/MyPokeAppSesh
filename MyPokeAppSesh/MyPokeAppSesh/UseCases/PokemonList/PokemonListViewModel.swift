//
//  PokemonListViewModel.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import Foundation

@MainActor
final class PokemonListViewModel: ObservableObject {
    @Published private(set) var state: PokemonListDataState<PokemonModel, NetworkError> = .idle
    
    @Published var loadingList: Bool = false
    
    private let repository: PokemonRepository = PokemonRepository()
}

// MARK: - Private
extension PokemonListViewModel {
    private func loadData() async {
        state = .loading
        do {
            let list = try await repository.pokemonListFirstLoad()
            state = .loaded(PokemonModel(list: list, items: try await repository.getPokemonDetail(model: list.results)))
        } catch {
            print(error)
        }
    }
}

// MARK: - Public
extension PokemonListViewModel {
    func onAppear() {
        
    }

    func onDisappear() {
    }
    
    func loadNextPage(url: String, model: PokemonModel) async {
        loadingList = true
        do {
            let list = try await repository.listPokemonResults(url: url)
            let newPokemon = try await repository.getPokemonDetail(model: list.results)
            model.addRows(newPokemon)
            if let newPage = list.nextPage {
                model.addNewPage(newPage: newPage)
            }
            state = .loaded(model)
            loadingList = false
        } catch {
            print(error)
        }
    }
    
    func hasReachedEnd(pokemon: PokemonModel.Pokemon, model: PokemonModel) -> Bool {
        model.items[model.items.count - 1].id == pokemon.id
    }

    func loadViewModel() {
        Task {
            await loadData()
        }
    }
}
