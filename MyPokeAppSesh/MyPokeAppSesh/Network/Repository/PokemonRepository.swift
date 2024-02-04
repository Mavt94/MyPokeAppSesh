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
    func listPokemonResults() async throws -> [PokemonListItemResponseBO]
    func getPokemonDetail() async throws -> [PokemonDetailResponseBO]
}

public final class PokemonNetwork: PokemonRepositoryActions {
    
    public init() {
    }
    
    public func listPokemonResults() async throws -> [PokemonListItemResponseBO] {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { throw NetworkError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse }
        
        do {
            let decoder = JSONDecoder()
            let list = try decoder.decode(PokemonListResponseDTO.self, from: data).results
            if let returnList = list?.compactMap({ $0.toBO() }) {
                return returnList
            } else {
                return []
            }
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    public func getPokemonDetail() async throws -> [PokemonDetailResponseBO] {
        var pokemonDetails: [PokemonDetailResponseBO] = []
        let pokemonList = try await listPokemonResults()
        
        for item in pokemonList {
            guard let url = URL(string: item.url) else { throw NetworkError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse }
            
            do {
                let decoder = JSONDecoder()
                let detail = try decoder.decode(PokemonDetailResponseDTO.self, from: data)
                if let detailToAppend = detail.toBO() {
                    pokemonDetails.append(detailToAppend)
                }
            } catch {
                throw NetworkError.invalidData
            }
        }
        
        return pokemonDetails
    }
}
