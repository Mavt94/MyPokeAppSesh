//
//  SpritesMapper.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

extension SpritesDTO {
    public func toBO() -> SpritesBO? {
        return SpritesBO(dto: self)
    }
}

extension SpritesBO {
    convenience init?(dto item: SpritesDTO) {
        guard let backDefault = item.backDefault, 
                let backShiny = item.backShiny,
                let frontDefault = item.frontDefault,
                let frontShiny = item.frontShiny else { return nil }
        self.init(backDefault: backDefault, backShiny: backShiny, frontDefault: frontDefault, frontShiny: frontShiny)
    }
}
