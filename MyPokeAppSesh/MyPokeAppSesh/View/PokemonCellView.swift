//
//  PokemonCellView.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import SwiftUI

struct PokemonCellView: View {
    
    let model: PokemonModel.Pokemon
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.pokemonNumber)
                    .foregroundStyle(.black)
                Text(model.name)
                    .foregroundStyle(.black)
                HStack {
                    ForEach(model.types, id: \.self) { type in
                        TypeTag(name: type, color: model.colorForType(type))
                    }
                }
            }
            .padding(.leading, 16)
            Spacer()
            AsyncImage(url: URL(string: model.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 94, height: 94)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(Color(hex: model.backgroundColor).opacity(0.8))
                            .frame(height: 102)
                    )
            } placeholder: {
                EmptyView()
            }
                
        }
        .frame(maxWidth: .infinity)
        .frame(height: 102)
        .background(Color(hex: model.backgroundColor).opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


//#Preview {
//    PokemonCellView()
//}
