//
//  DetailMoviewView.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import SwiftUI
import NukeUI

struct DetailMovieView: View {
    let viewModel: DetailMovieViewModel
    var body: some View {
        VStack(spacing: 50) {
            Text("Title:")
                .foregroundColor(.black)
                .font(.system(size: 20))
            
            Text("\(viewModel.movie.tile)")
                .foregroundColor(.red)
            
            HStack {
                Text("Type:")
                Text("\(viewModel.movie.movieType) 🍿")
            }
            
            
            LazyImage(url: URL(string: viewModel.movie.poster)!) { state in
                if let image = state.image {
                    image.resizable().aspectRatio(contentMode: .fill)
                } else {
                    Text("No image")
                }
            }
            .frame(maxWidth: 100, maxHeight: 100)
            
            Text("Movie Year: \(viewModel.movie.year)")
            
            
            Button {
                viewModel.saveToFavorits()
            } label: {
                Text("Add to favorits")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.green,
                                    lineWidth: 2)
                    }
            }
        }
        .padding()
    }
}

//struct DetailMoviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailMoviewView()
//    }
//}
