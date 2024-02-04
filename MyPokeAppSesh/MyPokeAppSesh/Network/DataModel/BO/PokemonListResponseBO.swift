//
//  PokemonListResponseBO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

public struct PokemonListResponseBO {
    public let results: [PokemonListItemResponseBO]
    
    public init(results: [PokemonListItemResponseBO]) {
        self.results = results
    }
}
