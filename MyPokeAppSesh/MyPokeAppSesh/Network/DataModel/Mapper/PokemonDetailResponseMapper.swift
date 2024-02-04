//
//  PokemonDetailResponseMapper.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

extension PokemonDetailResponseDTO {
    public func toBO() -> PokemonDetailResponseBO? {
        return PokemonDetailResponseBO(dto: self)
    }
}

extension PokemonDetailResponseBO {
    init?(dto item: PokemonDetailResponseDTO) {
        guard let baseExperience = item.baseExperience,
              let forms = item.forms?.compactMap({ $0.toBO() }),
              let height = item.height,
              let id = item.id,
              let name = item.name,
              let order = item.order,
              let species = item.species?.toBO(),
              let sprites = item.sprites?.toBO(),
              let types = item.types?.compactMap({ $0.toBO() }),
              let weight = item.weight else { return nil }
        self.init(baseExperience: baseExperience, forms: forms, height: height, id: id, name: name, order: order, species: species, sprites: sprites, types: types, weight: weight)
    }
}
