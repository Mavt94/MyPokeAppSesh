//
//  PokemonListResponse.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import Foundation

public struct PokemonListResponse: Codable, Identifiable {
    public var id: String { UUID().uuidString }
    public let results: [PokemonListItemResponse]?
}
