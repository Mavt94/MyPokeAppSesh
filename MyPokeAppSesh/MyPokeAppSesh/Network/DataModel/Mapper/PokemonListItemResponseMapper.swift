//
//  PokemonListItemResponseMapper.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

extension PokemonListItemResponseDTO {
    public func toBO() -> PokemonListItemResponseBO? {
        return PokemonListItemResponseBO(dto: self)
    }
}

extension PokemonListItemResponseBO {
    init?(dto item: PokemonListItemResponseDTO) {
        guard let name = item.name,
              let url = item.url else { return nil }
        self.init(name: name, url: url)
    }
}
