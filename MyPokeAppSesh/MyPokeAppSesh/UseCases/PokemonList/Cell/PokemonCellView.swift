//
//  PokemonCellView.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//

import SwiftUI
import SwiftData

struct PokemonCellView: View {
    
    @Environment(\.modelContext) var context
    @Query private var dataItems: [PokemonDetailData]
    
    @StateObject var viewModel: PokemonCellViewModel = PokemonCellViewModel()
    
    let model: PokemonModel.Pokemon
    @State var isFavorite: Bool = false
    
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
                    ForEach(model.types.sorted(), id: \.self) { type in
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
                    if !isFavorite {
                        context.insert(model.item.toDataModel())
                    } else {
                        viewModel.deleteItem(context: context, item: model.item.toDataModel())
                    }
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
        .onAppear {
            isFavorite = viewModel.checkFavorite(dataItems: dataItems, id: model.id)
        }
    }
}


#Preview {
    PokemonCellView(model: PokemonModel.Pokemon.mock())
}
