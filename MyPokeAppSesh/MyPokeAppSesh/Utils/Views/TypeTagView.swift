//
//  TypeTagView.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import SwiftUI

struct TypeTagView: View {
    
    var name: String
    var color: String
    
    var body: some View {
        Text(name.capitalized)
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
            .font(.custom(Constants.Font.poppinsRegular, size: 16))
            .foregroundStyle(.black)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .foregroundStyle(Color(hex: color))
            )
    }
}

#Preview {
    TypeTagView(name: "fire", color: "EE8130")
}
