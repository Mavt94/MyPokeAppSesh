//
//  StatResponseData.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 6/2/24.
//

import Foundation
import SwiftData

@Model
public class StatResponseData {
    let baseStat: Int
    let stat: StatData

    public init(baseStat: Int, stat: StatData) {
        self.baseStat = baseStat
        self.stat = stat
    }
}
