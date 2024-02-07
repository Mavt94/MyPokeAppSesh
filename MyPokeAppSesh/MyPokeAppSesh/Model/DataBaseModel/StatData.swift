//
//  StatData.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 6/2/24.
//

import Foundation
import SwiftData

@Model
public class StatData {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

// MARK: Data Model Map
extension StatData {
    func toResponseModel() -> Stat {
        return Stat(name: name)
    }
}
