//
//  PokemonDetail.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import SwiftUI

struct PokemonDetailView: View {
    
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
                                .foregroundStyle(Color(hex: model.colorForType(model.principalType)).opacity(0.8))
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
                        ForEach(model.types.sorted(), id: \.self) { type in
                            TypeTagView(name: type, color: model.colorForType(type))
                        }
                    }
                    .padding(.vertical, 16)
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text(Constants.statsTitle)
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
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 4)
                        )
                        VStack(alignment: .leading) {
                            Text(Constants.abilitiesTitle)
                                .font(.custom(Constants.Font.poppinsBold, size: 26))
                                .padding(.bottom, 8)
                            ForEach(model.abilities, id: \.self) { stat in
                                Text(stat)
                                    .font(.custom(Constants.Font.poppinsRegular, size: 16))
                            }
                        }
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 4)
                        )
                        
                    }
                }
                
                Spacer()
                
                HStack {
                    Text(Constants.shinyForm)
                        .font(.custom(Constants.Font.poppinsRegular, size: 22))
                    Spacer()
                    AsyncImage(url: URL(string: model.imageShiny)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .background(
                                Circle()
                                    .foregroundStyle(Color(hex: model.colorForType(model.principalType)).opacity(0.8))
                            )
                    } placeholder: {
                        EmptyView()
                    }
                    
                }
                .padding(.leading, 16)
                .background(.white)
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
        .background(
            Color(hex: model.backgroundColor).opacity(0.4)
        )
    }
}

#Preview {
    PokemonDetailView(model: PokemonModel.Pokemon.mock())
}
