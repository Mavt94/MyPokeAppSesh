//
//  PokemonListFirstLoadUseCase.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 5/2/24.
//

import Foundation

public protocol PokemonListFirstLoadUseCaseActions {
    func getPokemonListFirstLoad() async throws -> PokemonListResponseBO
}

public final class PokemonListFirstLoadUseCase: PokemonListFirstLoadUseCaseActions {
    private let repository: any PokemonRepositoryActions

    public init(repository: any PokemonRepositoryActions = PokemonNetwork()) {
        self.repository = repository
    }
    
    public func getPokemonListFirstLoad() async throws -> PokemonListResponseBO {
        return try await repository.pokemonListFirstLoad()
    }
}
