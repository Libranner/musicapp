//
//  ArtistListViewModel.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import Combine
import Foundation

class ArtistListViewModel: ObservableObject {
  private let artistsRepository: ArtistsRepository
  private var cancellables = Set<AnyCancellable>()

  @Published var searchResult = [Artist]()
  @Published var searchQuery = ""

  init(with artistsRepository: ArtistsRepository) {
    self.artistsRepository = artistsRepository

    $searchQuery
      .throttle(for: .milliseconds(300), scheduler: RunLoop.main, latest: true)
      .receive(on: DispatchQueue.main)
      .sink { _ in
      } receiveValue: { [weak self] query in
        guard let self = self else { return }
        self.searchArtist(for: query)
      }
      .store(in: &cancellables)
  }

  func searchArtist(for query: String) {
    guard !query.isEmpty else {
      return
    }

    artistsRepository.getArtists(for: query)
      .receive(on: DispatchQueue.main)
      .sink { _ in
      } receiveValue: { [weak self] result in
        guard let self = self else { return }
        self.searchResult = result
      }
      .store(in: &cancellables)
  }
}
