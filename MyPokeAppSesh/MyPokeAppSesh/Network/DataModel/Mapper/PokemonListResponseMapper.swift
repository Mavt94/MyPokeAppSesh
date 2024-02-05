//
//  PokemonListResponseMapper.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

extension PokemonListResponseDTO {
    public func toBO() -> PokemonListResponseBO? {
        return PokemonListResponseBO(dto: self)
    }
}

extension PokemonListResponseBO {
    init?(dto item: PokemonListResponseDTO) {
        guard let results = item.results else { return nil }
        self.init(results: results.compactMap { $0.toBO() }, nextPage: item.nextPage, previousPage: item.previousPage)
    }
}
