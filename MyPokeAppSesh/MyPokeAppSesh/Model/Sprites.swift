//
//  SpritesBO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

public class Sprites: Codable {
    public let backDefault: String
    public let backShiny: String
    public let frontDefault: String
    public let frontShiny: String
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
    
    public init(backDefault: String, backShiny: String, frontDefault: String, frontShiny: String) {
        self.backDefault = backDefault
        self.backShiny = backShiny
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
    }
}
