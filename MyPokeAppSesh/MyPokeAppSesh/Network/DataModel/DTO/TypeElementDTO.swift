//
//  TypeElementDTO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

public struct TypeElementDTO: Codable {
    public let type: SpeciesDTO?

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }
}
