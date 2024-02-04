//
//  PokemonListResponseDTO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import Foundation

public struct PokemonListResponseDTO: Codable {
    public let results: [PokemonListItemResponseDTO]?
}
