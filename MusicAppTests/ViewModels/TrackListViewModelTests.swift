//
//  TrackListViewModelTests.swift
//  MusicAppTests
//
//  Created by Libranner Leonel Santos Espinal on 29/9/21.
//

import Combine
import XCTest
@testable import MusicApp
import SwiftUI

final class TrackListViewModelTests: XCTestCase {
  private var cancellables = Set<AnyCancellable>()
  @ObservedObject private var viewModel = TrackListViewModel(with: MockArtistRepository(), album: Album(id: 1, title: "", cover: ""))

  func testGetTracks() throws {
    let expectation = XCTestExpectation(description: "Search completed")

    viewModel
      .$tracks
      .dropFirst()
      .sink{ items in
        XCTAssertGreaterThan(items.count, 1)
        expectation.fulfill()
      }
      .store(in: &cancellables)

    viewModel.getTracks()
    wait(for: [expectation], timeout: 1)
  }
}
