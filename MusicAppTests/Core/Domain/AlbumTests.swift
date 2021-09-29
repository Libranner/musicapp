//
//  AlbumTests.swift
//  MusicAppTests
//
//  Created by Libranner Leonel Santos Espinal on 30/9/21.
//

import XCTest
@testable import MusicApp

final class AlbumTests: XCTestCase {
  func testModelIsDecodable() throws {
    let data = try XCTUnwrap(DataLoader.load(dataType: .albums))

    let albumData = try XCTUnwrap(JSONDecoder().decode(Response<[Album]>.self, from: data))
    XCTAssertNotNil(albumData)
  }
}
