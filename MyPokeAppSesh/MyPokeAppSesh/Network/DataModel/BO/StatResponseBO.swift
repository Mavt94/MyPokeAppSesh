//
//  StatResponseBO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 5/2/24.
//

import Foundation

public struct StatResponseBO {
    public let baseStat: Int
    public let stat: StatBO

    public init(baseStat: Int, stat: StatBO) {
        self.baseStat = baseStat
        self.stat = stat
    }
}
