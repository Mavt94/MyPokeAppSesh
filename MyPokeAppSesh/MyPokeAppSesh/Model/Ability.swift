//
//  Ability.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 5/2/24.
//

import Foundation

public struct Ability: Codable {
    public let ability: Species
    
    enum CodingKeys: String, CodingKey {
        case ability = "ability"
    }

    public init(ability: Species) {
        self.ability = ability
    }
}

// MARK: Data Model Map
extension Ability {
    func toDataModel() -> AbilityData {
        return AbilityData(ability: ability.toDataModel())
    }
}
