//
//  TrackListViewModel.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import Combine
import Foundation

class TrackListViewModel: ObservableObject {
  private let artistsRepository: ArtistsRepository
  private var cancellables = Set<AnyCancellable>()

  @Published var tracks = [Track]()
  let album: Album

  init(with artistsRepository: ArtistsRepository, album: Album) {
    self.artistsRepository = artistsRepository
    self.album = album
  }

  func getTracks() {
    artistsRepository.getTracks(for: album.id)
      .receive(on: DispatchQueue.main)
      .sink { _ in
      } receiveValue: { [weak self] result in
        guard let self = self else { return }
        self.tracks = result
      }
      .store(in: &cancellables)
  }
}
