//
//  AbilityDTO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 5/2/24.
//

import Foundation

public struct AbilityDTO: Codable {
    public let ability: SpeciesDTO?

    enum CodingKeys: String, CodingKey {
        case ability = "ability"
    }
}
