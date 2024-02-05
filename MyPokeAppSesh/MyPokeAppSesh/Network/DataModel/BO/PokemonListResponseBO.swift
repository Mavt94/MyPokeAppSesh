//
//  PokemonListResponseBO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

public struct PokemonListResponseBO {
    public let results: [PokemonResultItemResponseBO]
    public let nextPage: String?
    public let previousPage: String?
    
    public init(results: [PokemonResultItemResponseBO], nextPage: String?, previousPage: String?) {
        self.results = results
        self.nextPage = nextPage
        self.previousPage = previousPage
    }
}
