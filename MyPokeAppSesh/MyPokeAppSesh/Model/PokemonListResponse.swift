//
//  PokemonListResponse.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

public struct PokemonListResponse: Codable {
    public let results: [PokemonResultItemResponse]
    public let nextPage: String?
    public let previousPage: String?
    
    enum CodingKeys: String, CodingKey {
        case results
        case nextPage = "next"
        case previousPage = "previous"
    }
    
    public init(results: [PokemonResultItemResponse], nextPage: String?, previousPage: String?) {
        self.results = results
        self.nextPage = nextPage
        self.previousPage = previousPage
    }
}
