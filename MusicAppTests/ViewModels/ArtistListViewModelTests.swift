//
//  ArtistListViewModel.swift
//  MusicAppTests
//
//  Created by Libranner Leonel Santos Espinal on 29/9/21.
//

import Combine
import XCTest
@testable import MusicApp
import SwiftUI

final class ArtistListViewModelTests: XCTestCase {
  private var cancellables = Set<AnyCancellable>()
  @ObservedObject private var viewModel = ArtistListViewModel(with: MockArtistRepository())

  func testArtistSearch() throws {
    let expectation = XCTestExpectation(description: "Search completed")

    viewModel
      .$searchResult
      .dropFirst()
      .sink{ items in
        XCTAssertGreaterThan(items.count, 1)
        expectation.fulfill()
      }
      .store(in: &cancellables)


    viewModel.searchArtist(for: "kygo")
    wait(for: [expectation], timeout: 1)
  }
}
