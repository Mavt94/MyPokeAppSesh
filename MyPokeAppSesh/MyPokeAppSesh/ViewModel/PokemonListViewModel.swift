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
    
    @Published var pokemonList: [PokemonModel.Pokemon] = []
    @Published var loadingList: Bool = false
    
    private let pokemonListResultsUseCase: any PokemonListResultsUseCaseActions
    private let pokemonGetResultsUseCase: any PokemonGetResultsUseCaseActions
    private let pokemonListFirstLoadUseCase: any PokemonListFirstLoadUseCaseActions
    
    nonisolated init(pokemonListResultsUseCase: any PokemonListResultsUseCaseActions = PokemonListUseCase(),
                     pokemonGetResultsUseCase: any PokemonGetResultsUseCaseActions = PokemonGetResultsUseCase(),
                     pokemonListFirstLoadUseCase: any PokemonListFirstLoadUseCaseActions = PokemonListFirstLoadUseCase()) {
        self.pokemonListResultsUseCase = pokemonListResultsUseCase
        self.pokemonGetResultsUseCase = pokemonGetResultsUseCase
        self.pokemonListFirstLoadUseCase = pokemonListFirstLoadUseCase
    }
}

// MARK: - Private
extension PokemonListViewModel {
    private func loadData() async {
        state = .loading
        do {
            let list = try await pokemonListFirstLoadUseCase.getPokemonListFirstLoad()
            state = .loaded(PokemonModel(list: list, items: try await pokemonGetResultsUseCase.getPokemonDetail(model: list.results)))
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
            let list = try await pokemonListResultsUseCase.getPokemonListResults(url: url)
            let newPokemon = try await pokemonGetResultsUseCase.getPokemonDetail(model: list.results)
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
