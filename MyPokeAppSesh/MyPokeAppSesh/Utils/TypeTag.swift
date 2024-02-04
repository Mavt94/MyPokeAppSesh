//
//  TypeTag.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import SwiftUI

struct TypeTag: View {
    
    var name: String
    var color: String
    
    var body: some View {
        Text(name.capitalized)
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
            .foregroundStyle(.white)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color(hex: color))
            )
    }
}

#Preview {
    TypeTag(name: "fire", color: "EE8130")
}
