//
//  SpeciesDTO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

public struct SpeciesDTO: Codable {
    public let name: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
