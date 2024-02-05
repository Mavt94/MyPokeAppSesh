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

public final class PokemonRepository {
    
    public init() {
    }
    
    public func pokemonListFirstLoad() async throws -> PokemonListResponse {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=10") else { throw NetworkError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse }
        
        do {
            let decoder = JSONDecoder()
            
            return try decoder.decode(PokemonListResponse.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    public func listPokemonResults(url: String) async throws -> PokemonListResponse {
        guard let url = URL(string: url) else { throw NetworkError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse }
        
        do {
            let decoder = JSONDecoder()
            
            return try decoder.decode(PokemonListResponse.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    public func getPokemonDetail(model: [PokemonResultItemResponse]) async throws -> [PokemonDetailResponse] {
        var pokemonDetails: [PokemonDetailResponse] = []
        
        for item in model {
            guard let url = URL(string: item.url) else { throw NetworkError.invalidURL }
            
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
