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
    
    private let pokemonListResultsUseCase: any PokemonListResultsUseCaseActions
    
    nonisolated init(pokemonListResultsUseCase: any PokemonListResultsUseCaseActions = PokemonListUseCase()) {
        self.pokemonListResultsUseCase = pokemonListResultsUseCase
    }
}

// MARK: - Private
extension PokemonListViewModel {
    private func loadData() async {
        state = .loading
        do {
            state = .loaded(PokemonModel(try await pokemonListResultsUseCase.getPokemonListResults()))
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

    func loadViewModel() {
        Task {
            await loadData()
        }
    }
}
