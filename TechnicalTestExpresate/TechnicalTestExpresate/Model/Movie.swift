//
//  Movie.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import Foundation

struct Movie: Decodable {
    let search: [MovieSearches]
    let totalResults: String
    let response: String
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

struct MovieSearches: Codable {
    let tile: String
    let year: String
    let imdbID: String
    let movieType: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case tile = "Title"
        case year = "Year"
        case imdbID
        case movieType = "Type"
        case poster = "Poster"
    }
}
