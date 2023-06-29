//
//  DetailMoviewViewModel.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import Foundation

class DetailMovieViewModel: ObservableObject {
    var user: User
    let movie: MovieSearches
    
    init(user: User, movie: MovieSearches) {
        self.user = user
        self.movie = movie
    }
    
    
    func saveToFavorits() {
        user.appendToUserFavorits(movie: movie)
        let encondedArrayFavoritsData = try? JSONEncoder().encode(user.userFavorits)
        UserDefaults.standard.set(encondedArrayFavoritsData, forKey: "userFavorits")
    }
}
