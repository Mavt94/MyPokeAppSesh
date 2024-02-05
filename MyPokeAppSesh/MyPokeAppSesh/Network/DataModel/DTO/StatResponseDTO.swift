//
//  StatResponseDTO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 5/2/24.
//

import Foundation

public struct StatResponseDTO: Codable {
    public let baseStat: Int?
    public let stat: StatDTO?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat = "stat"
    }
}
