//
//  PokemonDetailResponseDTO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import Foundation

public struct PokemonDetailResponseDTO: Codable, Identifiable {
    public let baseExperience: Int?
    public let stats: [StatResponseDTO]?
    public let abilities: [AbilityDTO]?
    public let forms: [SpeciesDTO]?
    public let height: Int?
    public let id: Int?
    public let name: String?
    public let order: Int?
    public let species: SpeciesDTO?
    public let sprites: SpritesDTO?
    public let types: [TypeElementDTO]?
    public let weight: Int?
    
    enum CodingKeys: String, CodingKey {
        case baseExperience = "base_experience"
        case stats = "stats"
        case abilities = "abilities"
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
