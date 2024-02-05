//
//  PokemonResultItemResponse.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

public struct PokemonResultItemResponse: Codable {
    public let name: String
    public let url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
    
    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
