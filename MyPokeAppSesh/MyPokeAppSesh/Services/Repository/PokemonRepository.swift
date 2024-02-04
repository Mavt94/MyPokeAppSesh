//
//  PokemonRepository.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

public protocol PokemonRepositoryActions {
    func listPokemonResults() async throws -> [PokemonListItemResponse]
    func getPokemonDetail() async throws -> [PokemonDetailResponse]
}

public final class PokemonNetwork: PokemonRepositoryActions {
    
    public init() {
    }
    
    public func listPokemonResults() async throws -> [PokemonListItemResponse] {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { throw NetworkError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(PokemonListResponse.self, from: data).results ?? []
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    public func getPokemonDetail() async throws -> [PokemonDetailResponse] {
        var pokemonDetails: [PokemonDetailResponse] = []
        let pokemonList = try await listPokemonResults()
        
        for item in pokemonList {
            guard let url = URL(string: item.url ?? "") else { throw NetworkError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse }
            
            do {
                let decoder = JSONDecoder()
                let detail = try decoder.decode(PokemonDetailResponse.self, from: data)
                pokemonDetails.append(detail)
            } catch {
                throw NetworkError.invalidData
            }
        }
        
        return pokemonDetails
    }
}
