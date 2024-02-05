//
//  PokemonListDataState.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import Foundation

public enum PokemonListDataState<T, E: Error>: Equatable {
    public static func == (lhs: PokemonListDataState, rhs: PokemonListDataState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.loading, .loading):
            return true
        default:
            return false
        }
    }
    
    case idle
    
    case loading
    
    case loaded(T)
    
    case error(E)
    
    var elementLoaded: T? {
        switch self {
        case .idle:
            return nil
        case .loading:
            return nil
        case let .loaded(element):
            return element
        case .error:
            return nil
        }
    }
}

extension PokemonListDataState where T: Equatable {
    public static func == (lhs: PokemonListDataState, rhs: PokemonListDataState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.loading, .loading):
            return true
        case (.loaded(let left), .loaded(let right)):
            if left == right {
                return true
            } else {
                return false
            }
        default:
            return false
        }
    }
}

extension PokemonListDataState where T: Equatable, E: Equatable {
    public static func == (lhs: PokemonListDataState, rhs: PokemonListDataState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.loading, .loading):
            return true
        case (.loaded(let left), .loaded(let right)):
            if left == right {
                return true
            } else {
                return false
            }
        case (.error(let left), .error(let right)):
            if left == right {
                return true
            } else {
                return false
            }
        default:
            return false
        }
    }
}

extension PokemonListDataState where E: Equatable {
    public static func == (lhs: PokemonListDataState, rhs: PokemonListDataState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.loading, .loading):
            return true
        case (.error(let left), .error(let right)):
            if left == right {
                return true
            } else {
                return false
            }
        default:
            return false
        }
    }
}
