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
    func pokemonListFirstLoad() async throws -> PokemonListResponseBO
    func listPokemonResults(url: String) async throws -> PokemonListResponseBO
    func getPokemonDetail(model: [PokemonResultItemResponseBO]) async throws -> [PokemonDetailResponseBO]
}

public final class PokemonNetwork: PokemonRepositoryActions {
    
    public init() {
    }
    
    public func pokemonListFirstLoad() async throws -> PokemonListResponseBO {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=10") else { throw NetworkError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse }
        
        do {
            let decoder = JSONDecoder()
            let list = try decoder.decode(PokemonListResponseDTO.self, from: data)
            if let returnList = list.toBO() {
                return returnList
            }
        } catch {
            throw NetworkError.invalidData
        }
        
        return PokemonListResponseBO(results: [], nextPage: "", previousPage: "")
    }
    
    public func listPokemonResults(url: String) async throws -> PokemonListResponseBO {
        guard let url = URL(string: url) else { throw NetworkError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse }
        
        do {
            let decoder = JSONDecoder()
            let list = try decoder.decode(PokemonListResponseDTO.self, from: data)
            if let returnList = list.toBO() {
                return returnList
            }
        } catch {
            throw NetworkError.invalidData
        }
        
        return PokemonListResponseBO(results: [], nextPage: "", previousPage: "")
    }
    
    public func getPokemonDetail(model: [PokemonResultItemResponseBO]) async throws -> [PokemonDetailResponseBO] {
        var pokemonDetails: [PokemonDetailResponseBO] = []
        
        for item in model {
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
