//
//  PokemonGetResultsUseCase.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 5/2/24.
//

import Foundation

public protocol PokemonGetResultsUseCaseActions {
    func getPokemonDetail(model: [PokemonResultItemResponseBO]) async throws -> [PokemonDetailResponseBO]
}

public final class PokemonGetResultsUseCase: PokemonGetResultsUseCaseActions {
    private let repository: any PokemonRepositoryActions

    public init(repository: any PokemonRepositoryActions = PokemonNetwork()) {
        self.repository = repository
    }
    
    public func getPokemonDetail(model: [PokemonResultItemResponseBO]) async throws -> [PokemonDetailResponseBO] {
        return try await repository.getPokemonDetail(model: model)
    }
}
