//
//  PokemonListViewModel.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import Foundation

@MainActor
final class PokemonListViewModel: ObservableObject {
    @Published private(set) var state: PokemonListDataState<PokemonModel, Error> = .idle
    
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
    func loadNextPageIfNeeded(model: PokemonModel, row: PokemonModel.Pokemon) async {
        
        guard let nextPage = model.nextPage else { return }
        
        if hasReachedEnd(pokemon: row, model: model) {
            do {
                loadingList = true
                let list = try await repository.listPokemonResults(url: nextPage)
                let newPokemon = try await repository.getPokemonDetail(model: list.results)
                model.addRows(newPokemon)
                if let newPage = list.nextPage {
                    model.addNewPage(newPage: newPage)
                }
                state = .loaded(model)
                loadingList = false
            } catch {
                state = .error(error)
            }
        }
    }
    
    func hasReachedEnd(pokemon: PokemonModel.Pokemon, model: PokemonModel) -> Bool {
        model.items[model.items.count - 3].id == pokemon.id
    }

    func loadViewModel() {
        Task {
            await loadData()
        }
    }
}
