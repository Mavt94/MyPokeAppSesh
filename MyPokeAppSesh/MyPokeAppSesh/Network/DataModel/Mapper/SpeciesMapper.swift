//
//  SpeciesMapper.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

extension SpeciesDTO {
    public func toBO() -> SpeciesBO? {
        return SpeciesBO(dto: self)
    }
}

extension SpeciesBO {
    init?(dto item: SpeciesDTO) {
        guard let name = item.name else { return nil }
        self.init(name: name)
    }
}
