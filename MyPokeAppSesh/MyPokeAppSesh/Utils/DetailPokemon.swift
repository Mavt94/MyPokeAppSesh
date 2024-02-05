//
//  DetailPokemon.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import SwiftUI

struct DetailPokemon: View {
    
    var model: PokemonModel.Pokemon
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center)  {
                AsyncImage(url: URL(string: model.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .background(
                            Circle()
                                .foregroundStyle(Color(hex: model.colorForType(model.principalType)).opacity(0.4))
                        )
                } placeholder: {
                    EmptyView()
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(model.pokemonNumber)
                        .font(.custom(Constants.Font.poppinsBold, size: 26))
                    Text(model.name)
                        .font(.custom(Constants.Font.poppinsBold, size: 24))
                    HStack {
                        ForEach(model.types, id: \.self) { type in
                            TypeTag(name: type, color: model.colorForType(type))
                        }
                    }
                    .padding(.vertical, 16)
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("Stats")
                                .font(.custom(Constants.Font.poppinsBold, size: 26))
                                .padding(.bottom, 8)
                            Text(model.baseExperience)
                                .font(.custom(Constants.Font.poppinsBold, size: 16))
                            ForEach(model.stats, id: \.self) { stat in
                                Text(stat)
                                    .font(.custom(Constants.Font.poppinsRegular, size: 16))
                            }
                        }
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 4)
                        )
                        VStack(alignment: .leading) {
                            Text("Abilities")
                                .font(.custom(Constants.Font.poppinsBold, size: 26))
                                .padding(.bottom, 8)
                            ForEach(model.abilities, id: \.self) { stat in
                                Text(stat)
                                    .font(.custom(Constants.Font.poppinsRegular, size: 16))
                            }
                        }
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 4)
                        )
                    }
                }
                
                Spacer()
                
                HStack {
                    Text("Shiny form")
                        .font(.custom(Constants.Font.poppinsRegular, size: 22))
                    Spacer()
                    AsyncImage(url: URL(string: model.imageShiny)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .background(
                                Circle()
                                    .foregroundStyle(Color(hex: model.colorForType(model.principalType)).opacity(0.4))
                            )
                    } placeholder: {
                        EmptyView()
                    }
                    
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity)
                .frame(height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 55))
                .overlay(
                    RoundedRectangle(cornerRadius: 55)
                        .stroke(Color.gray, lineWidth: 4)
                )
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    DetailPokemon(model: PokemonModel.Pokemon.mock())
}
