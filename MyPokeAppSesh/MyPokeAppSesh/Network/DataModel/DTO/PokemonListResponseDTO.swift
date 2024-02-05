//
//  PokemonListResponseDTO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import Foundation

public struct PokemonListResponseDTO: Codable {
    public let results: [PokemonResultItemResponseDTO]?
    public let nextPage: String?
    public let previousPage: String?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case nextPage = "next"
        case previousPage = "previous"
    }
}
