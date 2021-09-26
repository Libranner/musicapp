//
//  ArtistRepository.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import Combine

protocol ArtistsRepository {
  func getArtists(for query: String) -> AnyPublisher<[Artist], APIError>
  func getAlbums(for artistId: Double) -> AnyPublisher<[Album], APIError>
  func getTracks(for albumId: Double)  -> AnyPublisher<[Track], APIError>
}
