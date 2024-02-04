//
//  SpritesDTO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

public class SpritesDTO: Codable {
    public let backDefault: String?
    public let backShiny: String?
    public let frontDefault: String?
    public let frontShiny: String?
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}
