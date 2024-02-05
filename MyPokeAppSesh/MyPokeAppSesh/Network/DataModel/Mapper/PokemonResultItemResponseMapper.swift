//
//  PokemonResultItemResponseMapper.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

extension PokemonResultItemResponseDTO {
    public func toBO() -> PokemonResultItemResponseBO? {
        return PokemonResultItemResponseBO(dto: self)
    }
}

extension PokemonResultItemResponseBO {
    init?(dto item: PokemonResultItemResponseDTO) {
        guard let name = item.name,
              let url = item.url else { return nil }
        self.init(name: name, url: url)
    }
}
