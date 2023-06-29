//
//  MoviesService.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import Foundation
import Combine

class MovieService {
    private let networkProvider: NetworkProvider
    
    init(networkProvider: NetworkProvider) {
        self.networkProvider = networkProvider
    }
    
    func getMovies(by movieName: String) -> AnyPublisher<Movie, Error> {
        var request = URLRequest(url: NetworkProvider.baseURL)
        request.httpMethod = "GET"
        request.url?.append(queryItems: [
            URLQueryItem(name: "apikey", value: "4cfc7abc"),
            URLQueryItem(name: "s", value: movieName)
        ])
        
        return networkProvider.request(for: request)
    }
    
    
}
