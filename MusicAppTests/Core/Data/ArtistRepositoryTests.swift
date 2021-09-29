//
//  ArtistRepositoryTests.swift
//  MusicAppTests
//
//  Created by Libranner Leonel Santos Espinal on 29/9/21.
//

import Combine
import XCTest
@testable import MusicApp

final class ArtistRepositoryTests: XCTestCase {
  private var cancellables = Set<AnyCancellable>()

  func testGetArtists() throws {
    let expectation = XCTestExpectation(description: "Parser finished")

    MockArtistRepository()
      .getArtists(for: "kygo")
      .sink(
        receiveCompletion: { _ in
        },
        receiveValue: { assets in
          XCTAssertEqual(25, assets.count)
          expectation.fulfill()
        }
      )
      .store(in: &cancellables)

    wait(for: [expectation], timeout: 0.5)
  }

  func testGetAlbums() throws {
    let expectation = XCTestExpectation(description: "Parser finished")

    MockArtistRepository()
      .getAlbums(for: 0)
      .sink(
        receiveCompletion: { _ in
        },
        receiveValue: { items in
          XCTAssertGreaterThan(items.count, 0)
          expectation.fulfill()
        }
      )
      .store(in: &cancellables)

    wait(for: [expectation], timeout: 0.5)
  }

  func testGetTracks() throws {
    let expectation = XCTestExpectation(description: "Parser finished")

    MockArtistRepository()
      .getTracks(for: 0)
      .sink(
        receiveCompletion: { _ in
        },
        receiveValue: { items in
          XCTAssertGreaterThan(items.count, 0)
          expectation.fulfill()
        }
      )
      .store(in: &cancellables)

    wait(for: [expectation], timeout: 0.5)
  }
}
