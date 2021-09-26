//
//  ArtistsRemoteRepository.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import Combine
import Foundation

struct ArtistsRemoteRepository: ArtistsRepository {
  private let urlSession =  URLSession.shared
  private let decoder = JSONDecoder()

  func getArtists(for query: String) -> AnyPublisher<[Artist], APIError> {
    guard let url = Endpoints.artists(query: query).url else {
      return Fail(error: APIError.badURL).eraseToAnyPublisher()
    }

    return urlSession.publisher(for: url)
  }

  func getAlbums(for artistId: Double) -> AnyPublisher<[Album], APIError> {
    guard let url = Endpoints.albums(artistId: artistId).url else {
      return Fail(error: APIError.badURL).eraseToAnyPublisher()
    }

    return urlSession.publisher(for: url)
  }

  func getTracks(for albumId: Double) -> AnyPublisher<[Track], APIError> {
    guard let url = Endpoints.albums(artistId: albumId).url else {
      return Fail(error: APIError.badURL).eraseToAnyPublisher()
    }

    return urlSession.publisher(for: url)
  }
}

private extension ArtistsRemoteRepository {
  enum Endpoints {
    case artists(query: String)
    case albums(artistId: Double)
    case tracks(albumId: Double)

    var url: URL? {
      switch self {
      case .artists(let query):
        return makeURL(path: "/search/artist", queryItems: [URLQueryItem(name: "q", value: query)])
      case .albums(let artistId):
        return makeURL(path: "/artist/\(artistId)/albums")
      case .tracks(let albumId):
        return makeURL(path: "/album/\(albumId)/tracks")
      }
    }

    private func makeURL(path: String, queryItems: [URLQueryItem]? = nil) -> URL? {
      var components = URLComponents()
      components.scheme = "https"
      components.host = "api.deezer.com"
      components.path = path
      components.queryItems = queryItems

      return components.url
    }
  }
}
