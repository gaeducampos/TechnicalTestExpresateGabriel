//
//  NetworkProvider.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import Foundation
import Combine

class NetworkProvider  {
    static let baseURL = URL(string: "https://www.omdbapi.com/")!
    
    enum NetworkinError: Error {
        case failedRequest
    }
    
    func request(for request: URLRequest) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data: Data, response: URLResponse) in
                if let response = response as? HTTPURLResponse,
                   (200..<300).contains(response.statusCode) {
                    return data
                } else {
                    throw NetworkinError.failedRequest
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func request<Value: Decodable>(
        for request: URLRequest,
        decoder: JSONDecoder = JSONDecoder()
    ) -> AnyPublisher<Value, Error> {
        self.request(for: request)
            .decode(type: Value.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
