//
//  StatResponse.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 5/2/24.
//

import Foundation

public struct StatResponse: Codable {
    public let baseStat: Int
    public let stat: Stat

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat = "stat"
    }
    
    public init(baseStat: Int, stat: Stat) {
        self.baseStat = baseStat
        self.stat = stat
    }
}
