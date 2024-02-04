//
//  PokemonDetailResponse.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import Foundation

public enum Element: String, Codable {
    case grass = "grass"
    case poison = "poison"
    case fire = "fire"
    case flying = "flying"
    case water = "water"
    case bug = "bug"
    case normal = "normal"
    case electric = "electric"
    case ground = "ground"
    case fairy = "fairy"
    case fighting = "fighting"
    case psychic = "psychic"
    case rock = "rock"
    case steel = "steel"
    case ice = "ice"
    case ghost = "ghost"
    case dragon = "dragon"
}

public struct PokemonDetailResponse: Codable, Identifiable {
    public let baseExperience: Int?
    public let forms: [Species]?
    public let height: Int?
    public let id: Int?
    public let name: String?
    public let order: Int?
    public let species: Species?
    public let sprites: Sprites?
    public let types: [TypeElement]?
    public let weight: Int?
    
    enum CodingKeys: String, CodingKey {
        case baseExperience = "base_experience"
        case forms = "forms"
        case height = "height"
        case id = "id"
        case name = "name"
        case order = "order"
        case species = "species"
        case sprites = "sprites"
        case types = "types"
        case weight = "weight"
    }
}

public struct Species: Codable {
    public let name: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

public class Sprites: Codable {
    public let backDefault: String?
    public let backShiny: String?
    public let frontDefault: String?
    public let frontShiny: String?
    public let animated: Sprites?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case animated = "animated"
    }
}

public struct TypeElement: Codable {
    public let type: Species?

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }
}

