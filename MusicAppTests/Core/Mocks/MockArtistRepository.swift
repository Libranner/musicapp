//
//  MockArtistRepository.swift
//  MusicAppTests
//
//  Created by Libranner Leonel Santos Espinal on 29/9/21.
//

import Combine
import Foundation
@testable import MusicApp

struct MockArtistRepository: ArtistsRepository {
  func getArtists(for query: String) -> AnyPublisher<[Artist], APIError> {
    return load(dataType: .artists)
  }

  func getAlbums(for artistId: Int) -> AnyPublisher<[Album], APIError> {
    return load(dataType: .albums)
  }

  func getTracks(for albumId: Int) -> AnyPublisher<[Track], APIError> {
    return load(dataType: .tracks)
  }

  private func load<T: Decodable>(dataType: DataType) -> AnyPublisher<[T], APIError> {
    guard let data = try? DataLoader.load(dataType: dataType) else {
      preconditionFailure("No Data available")
    }

    let response = try? JSONDecoder().decode(Response<[T]>.self, from: data)
    return Just(response?.result ?? [])
      .setFailureType(to: APIError.self)
      .eraseToAnyPublisher()
  }
}
