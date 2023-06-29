//
//  User.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import Foundation

struct User: Encodable {
    let id: UUID
    let email: String
    let password: String
    var userFavorits: [MovieSearches]
    
    mutating func appendToUserFavorits(movie: MovieSearches) {
        userFavorits.append(movie)
    }
}

