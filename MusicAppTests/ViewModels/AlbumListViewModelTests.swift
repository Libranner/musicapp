//
//  AlbumListViewModel.swift
//  MusicAppTests
//
//  Created by Libranner Leonel Santos Espinal on 29/9/21.
//

import Combine
import XCTest
@testable import MusicApp
import SwiftUI

final class AlbumListViewModelTests: XCTestCase {
  private var cancellables = Set<AnyCancellable>()
  @ObservedObject private var viewModel = AlbumListViewModel(with: MockArtistRepository(), artist: Artist(id: 1, name: "", picture: ""))

  func testGetAlbums() throws {
    let expectation = XCTestExpectation(description: "Search completed")

    viewModel
      .$albums
      .dropFirst()
      .sink{ items in
        XCTAssertGreaterThan(items.count, 1)
        expectation.fulfill()
      }
      .store(in: &cancellables)


    viewModel.getAlbums()
    wait(for: [expectation], timeout: 1)
  }
}
