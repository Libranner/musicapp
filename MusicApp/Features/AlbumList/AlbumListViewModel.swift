//
//  AlbumListViewModel.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import Combine
import Foundation

class AlbumListViewModel: ObservableObject {
  private let artistsRepository: ArtistsRepository
  private var cancellables = Set<AnyCancellable>()
  @Published var albums = [Album]()
  let artist: Artist

  init(with artistsRepository: ArtistsRepository, artist: Artist) {
    self.artistsRepository = artistsRepository
    self.artist = artist
  }

  func getAlbums() {
    artistsRepository.getAlbums(for: artist.id)
      .receive(on: DispatchQueue.main)
      .sink { _ in
      } receiveValue: { [weak self] result in
        guard let self = self else { return }
        self.albums = result
      }
      .store(in: &cancellables)
  }
}
