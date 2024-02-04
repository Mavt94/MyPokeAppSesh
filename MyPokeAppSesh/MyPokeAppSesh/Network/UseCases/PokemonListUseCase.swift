//
//  PokemonListUseCase.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import Foundation

public protocol PokemonListResultsUseCaseActions {
    func getPokemonListResults() async throws -> [PokemonDetailResponseBO]
}

public final class PokemonListUseCase: PokemonListResultsUseCaseActions {
    private let repository: any PokemonRepositoryActions

    public init(repository: any PokemonRepositoryActions = PokemonNetwork()) {
        self.repository = repository
    }
    
    public func getPokemonListResults() async throws -> [PokemonDetailResponseBO] {
        return try await repository.getPokemonDetail()
    }
}
