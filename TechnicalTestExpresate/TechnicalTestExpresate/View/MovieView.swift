//
//  MovieView.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import SwiftUI

struct MovieView: View {
    @ObservedObject var viewModel: MovieViewModel
    
    
    var body: some View {
        VStack {
            Text("Movies App")
            
            HStack {
                TextField("MovieName", text: $viewModel.movieName)
                    .textFieldStyle(.roundedBorder)
                
                Button("Search Movie") {
                    viewModel.getMovies(by: viewModel.movieName)
                }
            }
            
            List(viewModel.searchedMovies, id: \.imdbID) { movie in
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name: \(movie.tile)")
                        Text("Year: \(movie.year)")
                    }
                }
                .onTapGesture {
                    viewModel.movieDetailSubject.send(movie)
                }
            }
            
            
        }
        .padding()
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(viewModel: .init(service: .init(networkProvider: .init())))
    }
}
