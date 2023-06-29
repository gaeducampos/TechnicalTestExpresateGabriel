//
//  MoviewViewModel.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import Foundation
import Combine

final class MovieViewModel: ObservableObject {
    private let service: MovieService
    private var movieCancellable: AnyCancellable?
    
    @Published var searchedMovies: [MovieSearches] = []
    
    
    @Published var movieName = ""
    
    let movieDetailSubject = PassthroughSubject<MovieSearches, Never>()
    
    init(service: MovieService) {
        self.service = service
    }
    
    func getMovies(by MovieName: String) {
        movieCancellable = service.getMovies(by: MovieName)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Faiulure \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] movies in
                self?.searchedMovies = movies.search
            })
    }
    
}
