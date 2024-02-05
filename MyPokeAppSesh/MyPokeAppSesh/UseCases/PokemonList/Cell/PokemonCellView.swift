//
//  PokemonCellView.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import SwiftUI

struct PokemonCellView: View {
    
    @State var isFavorite: Bool = false
    
    let model: PokemonModel.Pokemon
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(model.pokemonNumber)
                    .font(.custom(Constants.Font.poppinsRegular, size: 16))
                    .foregroundStyle(.black)
                Text(model.name)
                    .font(.custom(Constants.Font.poppinsRegular, size: 24))
                    .foregroundStyle(.black)
                HStack {
                    ForEach(model.types, id: \.self) { type in
                        TypeTagView(name: type, color: model.colorForType(type))
                    }
                }
            }
            .padding(.leading, 16)
            Spacer()
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundColor(isFavorite ? .red : .gray)
                .imageScale(.large)
                .onTapGesture {
                    isFavorite.toggle()
                }
            AsyncImage(url: URL(string: model.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 94, height: 94)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(Color(hex: model.backgroundColor).opacity(0.8))
                            .frame(height: 120)
                    )
            } placeholder: {
                EmptyView()
            }
                
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(Color(hex: model.backgroundColor).opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


#Preview {
    PokemonCellView(model: PokemonModel.Pokemon.mock())
}
