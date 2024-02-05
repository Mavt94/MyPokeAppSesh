//
//  AbilityMapper.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 5/2/24.
//

import Foundation

extension AbilityDTO {
    public func toBO() -> AbilityBO? {
        return AbilityBO(dto: self)
    }
}

extension AbilityBO {
    init?(dto item: AbilityDTO) {
        guard let ability = item.ability?.toBO() else { return nil }
        self.init(ability: ability)
    }
}
