//
//  StatResponseMapper.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 5/2/24.
//

import Foundation

extension StatResponseDTO {
    public func toBO() -> StatResponseBO? {
        return StatResponseBO(dto: self)
    }
}

extension StatResponseBO {
    init?(dto item: StatResponseDTO) {
        guard let baseStat = item.baseStat, let stat = item.stat?.toBO() else { return nil }
        self.init(baseStat: baseStat, stat: stat)
    }
}
