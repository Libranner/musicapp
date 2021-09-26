//
//  URLSession+Extensions.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import Combine
import Foundation

extension URLSession {
    func publisher<T: Decodable>(
        for url: URL,
        responseType: T.Type = T.self,
        decoder: JSONDecoder = .init()
    ) -> AnyPublisher<T, APIError> {
        dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Response<T>.self, decoder: decoder)
            .map(\.result)
            .mapError { error in
              .network(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
