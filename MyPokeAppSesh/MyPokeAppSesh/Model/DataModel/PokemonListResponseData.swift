//
//  PokemonListResponseData.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 6/2/24.
//

import Foundation
import SwiftData

@Model
final class PokemonListResponseData: Identifiable {
    let results: [PokemonResultItemResponseData]
    let nextPage: String?
    let previousPage: String?
    
    init(results: [PokemonResultItemResponseData], nextPage: String?, previousPage: String?) {
        self.results = results
        self.nextPage = nextPage
        self.previousPage = previousPage
    }
}
