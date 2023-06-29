//
//  FavoritsView.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import SwiftUI

struct FavoritsView: View {
    let favorits: [MovieSearches]
    var body: some View {
        VStack {
            Text("Favorits")
            
            List(favorits, id: \.imdbID) { movie in
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name: \(movie.tile)")
                        Text("Year: \(movie.year)")
                    }
                }
            }
            
        }
    }
}

//struct FavoritsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritsView()
//    }
//}
